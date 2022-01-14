Return-Path: <SRS0=PHwD=R6=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF661C433F5
	for <soc@archiver.kernel.org>; Fri, 14 Jan 2022 02:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9716FC36AF2; Fri, 14 Jan 2022 02:08:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B21EC36AE3;
	Fri, 14 Jan 2022 02:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B21EC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642126104; x=1673662104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ghBSgNiMzX0EVCLVUvRgnSDfTK4GjS2KttxsrSC72TQ=;
  b=bfFSx3HrZcXMX0/OpF57bZyZdGWVAROC+Q8UN7MczC4HcvYu+H0NELR8
   LZcdAHTUhYN1BmbpzV+nTkoMoDR7hpAeoMQSeCL4C1h9aMa9eE6jKzVbT
   GJUHDcz3KuaTDGRhL0Sknq4OFI0nLvucXldraSy8Bh830SCQq99TTfn5f
   jfSCcOyXNtG1kqCE7xgzj4gPm/5TWk8HjqRxAV9SmqGAl+DNZeLoEWMm1
   Nh9Bze/jOmomQKyTdoy66NW/JziDs9XivNeCe4UWYBd2hOxx564CzRhvZ
   FIhjzoKtxsJgAvLysmmpw6OzkF6KI+JsK/aYy+PgIGCuhGr674D4UfoMz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244367402"
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="244367402"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 18:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="624177682"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Jan 2022 18:08:20 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8C0p-0007xW-G0; Fri, 14 Jan 2022 02:08:19 +0000
Date: Fri, 14 Jan 2022 10:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: kbuild-all@lists.01.org, soc@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, olof@lixom.net,
	linus.walleij@linaro.org, catalin.marinas@arm.com,
	robh+dt@kernel.org, krzysztof.kozlowski@canonical.com
Subject: Re: [PATCH 14/23] arm64: dts: fsd: Add initial device tree support
Message-ID: <202201141032.5xT5iNdz-lkp@intel.com>
References: <20220113121143.22280-15-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113121143.22280-15-alim.akhtar@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alim,

I love your patch! Yet something to improve:

[auto build test ERROR on v5.16]
[also build test ERROR on next-20220113]
[cannot apply to clk/clk-next robh/for-next pinctrl-samsung/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alim-Akhtar/dt-bindings-clock-Document-FSD-CMU-bindings/20220113-211129
base:    df0cc57e057f18e44dac8e6c18aba47ab53202f9
config: arm64-randconfig-r014-20220113 (https://download.01.org/0day-ci/archive/20220114/202201141032.5xT5iNdz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7edcfae09ff2aa85ae39f2240b13ea17eac8be94
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alim-Akhtar/dt-bindings-clock-Document-FSD-CMU-bindings/20220113-211129
        git checkout 7edcfae09ff2aa85ae39f2240b13ea17eac8be94
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/tesla/fsd.dtsi:11,
                    from arch/arm64/boot/dts/tesla/fsd.dts:12:
>> scripts/dtc/include-prefixes/dt-bindings/clock/fsd-clk.h:12: error: unterminated #ifndef
      12 | #ifndef _DT_BINDINGS_CLOCK_FSD_H
         | 


vim +12 scripts/dtc/include-prefixes/dt-bindings/clock/fsd-clk.h

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
