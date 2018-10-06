{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_1JC3_Assign1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/omar/Documents/School/COMPSCI 1JC3  /1JC3-Assign1/.stack-work/install/x86_64-linux/lts-8.24/8.0.2/bin"
libdir     = "/home/omar/Documents/School/COMPSCI 1JC3  /1JC3-Assign1/.stack-work/install/x86_64-linux/lts-8.24/8.0.2/lib/x86_64-linux-ghc-8.0.2/1JC3-Assign1-0.1.0.0-4ZQ50ieb3Ae5SnuZ35RCV1"
dynlibdir  = "/home/omar/Documents/School/COMPSCI 1JC3  /1JC3-Assign1/.stack-work/install/x86_64-linux/lts-8.24/8.0.2/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/omar/Documents/School/COMPSCI 1JC3  /1JC3-Assign1/.stack-work/install/x86_64-linux/lts-8.24/8.0.2/share/x86_64-linux-ghc-8.0.2/1JC3-Assign1-0.1.0.0"
libexecdir = "/home/omar/Documents/School/COMPSCI 1JC3  /1JC3-Assign1/.stack-work/install/x86_64-linux/lts-8.24/8.0.2/libexec"
sysconfdir = "/home/omar/Documents/School/COMPSCI 1JC3  /1JC3-Assign1/.stack-work/install/x86_64-linux/lts-8.24/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "1JC3_Assign1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "1JC3_Assign1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "1JC3_Assign1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "1JC3_Assign1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "1JC3_Assign1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "1JC3_Assign1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
