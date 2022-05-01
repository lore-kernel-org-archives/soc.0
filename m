Return-Path: <SRS0=tqmG=VJ=intel.com=lkp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C81C433EF
	for <soc@archiver.kernel.org>; Sun,  1 May 2022 08:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33206C385AA; Sun,  1 May 2022 08:33:30 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12D64C385A9;
	Sun,  1 May 2022 08:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12D64C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651394008; x=1682930008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jrNTj0JJ2uvFbhnV20wpOWnX46OpvszfsQI3AOx8Eq0=;
  b=eQk0LiWXmykFvyHeqFBFG4uK0OG2ElP7Ywjbo0xYCfLWurhRWCOWFgpp
   C6LmTpb4mVwMlcGwEUnIKJyh+fu6eGP6tYcPpOeB6Ii2ImWKaR21Ii49C
   pI6G/hUya3Q3K6kG/BOT/9G2Cgoh8Sn+ulhA9skT9CafZZJ1Yz7sb2+mX
   P2uNiT9v7rBiQo4N+rh/bWsw8gmo1y9flMQVZTw5GtMwerucPfu/QxUqT
   vTEXzMtnY3r9qC5tVPXfWNXR6Ugd8c5XrdbQlGaEsg7Mml0CdcHkT9flT
   DbKR3pFUuga1imckVebx9Oi889BHaDvcosdK82hu1FiUFJATZ/cqk0VPT
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="264572607"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; 
   d="scan'208";a="264572607"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 01:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; 
   d="scan'208";a="619433028"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 May 2022 01:33:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nl51A-0008cV-6m;
	Sun, 01 May 2022 08:33:24 +0000
Date: Sun, 1 May 2022 16:32:47 +0800
From: kernel test robot <lkp@intel.com>
List-Id: <soc.lore.kernel.org>
To: "Marty E. Plummer" <hanetzer@startmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>, Russell King <linux@armlinux.org.uk>
Cc: kbuild-all@lists.01.org, "Marty E. Plummer" <hanetzer@startmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm: hisi: enable Hi3521a soc
Message-ID: <202205011637.T9bZyDaL-lkp@intel.com>
References: <20220501051020.2432338-3-hanetzer@startmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501051020.2432338-3-hanetzer@startmail.com>

Hi "Marty,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on soc/for-next robh/for-next krzk/for-next krzk-mem-ctrl/for-next v5.18-rc4 next-20220429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marty-E-Plummer/clk-hisilicon-add-CRG-driver-Hi3521a-SoC/20220501-141036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-randconfig-r001-20220501 (https://download.01.org/0day-ci/archive/20220501/202205011637.T9bZyDaL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6677e373bf0fbceb87ba267fa934df2f4b7dc0ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marty-E-Plummer/clk-hisilicon-add-CRG-driver-Hi3521a-SoC/20220501-141036
        git checkout 6677e373bf0fbceb87ba267fa934df2f4b7dc0ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[2]: *** No rule to make target 'arch/arm/boot/dts/hi3521a-rs-dm290e.dtb', needed by '__build'.
   make[2]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
