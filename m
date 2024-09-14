Return-Path: <SRS0=mfTL=QM=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C96C02181
	for <soc@archiver.kernel.org>; Sat, 14 Sep 2024 07:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40A15C4CED1; Sat, 14 Sep 2024 07:51:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96B5BC4CEC0;
	Sat, 14 Sep 2024 07:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96B5BC4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726300314; x=1757836314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OKnTmCysulXKbT4ZKNh5klyTLSHK15YdICCeMSP/N9o=;
  b=fhmF4/vTATu46LsdtjZycXOlXt40gnyZa0zzA5uMbstbT5d8ACSl+oG6
   noQ12xVLWkn0yX5e4LhQ5r3+V3hwKYjB+IbidMDxIYpK/YWZUKv+bzizA
   m4+uB0++hD5amybRxAWZw4PIpkQEUGx9rNkYBmaH8kYT6DKDrHRalC2bm
   ga7gfqqE+uydg/aUZaQSzPlR1/QX00dnv9m7N8QnxxF6493TGOAsCo1/a
   PhLEOREr6Y48u7E0GoykQ35XCL3vRHmHtoCNuBN+zwLSJooqN6PyaE88g
   xcI7R9UxiMiSeyD9h0R6KZ5C2O2hUEdl4sNVsn0NI0HHC9RxE1O4mMYQt
   g==;
X-CSE-ConnectionGUID: VS79RTd1RF6RzSIPDPGOCg==
X-CSE-MsgGUID: PFyBMmjkQXeIDNA07VPf1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25329335"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25329335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 00:51:53 -0700
X-CSE-ConnectionGUID: ZqZxkgsFSfejP6fPpLpfSA==
X-CSE-MsgGUID: 5pLASHcsRF6ca0W7KIuHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68666216"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2024 00:51:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spNZK-0007Vq-1y;
	Sat, 14 Sep 2024 07:51:46 +0000
Date: Sat, 14 Sep 2024 15:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH leds v3 02/11] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <202409141525.4s6yDTJw-lkp@intel.com>
References: <20240913123103.21226-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913123103.21226-3-kabel@kernel.org>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240913]
[also build test ERROR on v6.11-rc7]
[cannot apply to lee-leds/for-leds-next robh/for-next linus/master v6.11-rc7 v6.11-rc6 v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20240913-203320
base:   next-20240913
patch link:    https://lore.kernel.org/r/20240913123103.21226-3-kabel%40kernel.org
patch subject: [PATCH leds v3 02/11] leds: turris-omnia: Use command execution functions from the MCU driver
config: i386-buildonly-randconfig-002-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141525.4s6yDTJw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141525.4s6yDTJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141525.4s6yDTJw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "omnia_cmd_write_read" [drivers/leds/leds-turris-omnia.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
