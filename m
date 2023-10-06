Return-Path: <SRS0=OAv5=FU=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA34FE92FE4
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 05:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6FA2C433C7; Fri,  6 Oct 2023 05:21:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10491C433CA;
	Fri,  6 Oct 2023 05:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10491C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696569698; x=1728105698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kTezNlXjIvleKEn+KNJaXcoyrpYTmoUt9fJbdVMLQBs=;
  b=GEFQZWHQ5mgjG0UFSCF0W47CWqlMz8HEFartw7GMg//pQ9OMXKL1uRk2
   KZY5AB8Be84LX7u9zM5PuoGyYAUk7PrFkM+AbOZN4wm2HMFrIZq+T8Vld
   lttMqZ+/NRoyV/ks8V4jRhnGVDe88BKCuKKvwLT1QSRXlSFQpKSL435Ii
   L54EqeIABLb5lk2kOGQy+xhmalm7LV/y3Vpdj8IidEtBArEC9HJ79O/Tr
   df53z++7NcuWB0fW3o9FB5eaB4+qMS31ohzcm568T1Lz0lR5efN41vTo8
   KfUCd3xOe/VEKc26wbCXO/qEFuLR/IIvYH/6eB4Rsq6quZz7FJ0PLaAMa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363958922"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363958922"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 22:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787263452"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="787263452"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 22:21:25 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qodH7-000MI2-2b;
	Fri, 06 Oct 2023 05:21:22 +0000
Date: Fri, 6 Oct 2023 13:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, peter.griffin@linaro.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 15/21] clk: google: gs101: Add support for CMU_MISC clock
 unit
Message-ID: <202310061359.5WMm9C9Y-lkp@intel.com>
References: <20231005155618.700312-16-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-16-peter.griffin@linaro.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on robh/for-next linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-interrupt-controller-Add-gs101-interrupt-controller/20231005-235922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20231005155618.700312-16-peter.griffin%40linaro.org
patch subject: [PATCH 15/21] clk: google: gs101: Add support for CMU_MISC clock unit
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310061359.5WMm9C9Y-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061359.5WMm9C9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061359.5WMm9C9Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/samsung/clk-gs101.c:17:
>> drivers/clk/samsung/clk-gs101.c:2087:7: warning: 'mout_misc_gic_p' defined but not used [-Wunused-const-variable=]
    2087 | PNAME(mout_misc_gic_p)                  = { "oscclk", "dout_cmu_misc_sss" };
         |       ^~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
   drivers/clk/samsung/clk-gs101.c:937:7: warning: 'mout_cmu_g2d_p' defined but not used [-Wunused-const-variable=]
     937 | PNAME(mout_cmu_g2d_p)           = { "dout_shared0_div3", "fout_shared3_pll",
         |       ^~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
   drivers/clk/samsung/clk-gs101.c:890:7: warning: 'mout_cmu_boost_p' defined but not used [-Wunused-const-variable=]
     890 | PNAME(mout_cmu_boost_p)         = { "dout_shared0_div4", "dout_shared1_div4",
         |       ^~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
   drivers/clk/samsung/clk-gs101.c:811:7: warning: 'mout_cmu_pdp_vra_p' defined but not used [-Wunused-const-variable=]
     811 | PNAME(mout_cmu_pdp_vra_p)       = { "fout_shared2_pll", "dout_shared0_div3",
         |       ^~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^


vim +/mout_misc_gic_p +2087 drivers/clk/samsung/clk-gs101.c

  2083	
  2084	/* List of parent clocks for Muxes in CMU_MISC */
  2085	PNAME(mout_misc_bus_user_p)		= { "oscclk", "dout_cmu_misc_bus" };
  2086	PNAME(mout_misc_sss_user_p)		= { "oscclk", "dout_cmu_misc_sss" };
> 2087	PNAME(mout_misc_gic_p)			= { "oscclk", "dout_cmu_misc_sss" };
  2088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
