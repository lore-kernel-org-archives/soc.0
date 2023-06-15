Return-Path: <SRS0=TRjL=CD=linux.intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDAEEB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 211F8C433C0; Thu, 15 Jun 2023 16:42:08 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AB93C433C9;
	Thu, 15 Jun 2023 16:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AB93C433C9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686847326; x=1718383326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xilr+ijZitGWtrcSeM2+M4EshRSS2ggsV9dqnYH1Hiw=;
  b=ea2+TfZgxA0iaeiF4MGci1tBU2npdKZ/JzerL70z/sR8EoVRwAR7e/eU
   SFcHD4LxfqTw7/sw93VQ+9rsABX97ePs5JIvbugaKvxiAy+qqTt6qwnlI
   p9kNAktZ/UxM0YorljcY/WOFz8oseQx3JnhojXeC7JdCb4YkNwC/8clg/
   mmQQ3X7I37caw4Vur51BTZyKYVD/FJX2Nu4wvAPV70akZg1U8LPWwpCET
   tFyoiUCbA5X1bmJeOf0TTQBYk4YE/jqwV0HJOCq97q+2UyH6D5EYvBoqH
   NUOvDG1kpVAXkfckYUI2NfzEQieRBa7scUDQgCPMuNXeQ06wyUZ61d6AX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445342781"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="445342781"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 09:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="1042757398"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="1042757398"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2023 09:41:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5D2DD379; Thu, 15 Jun 2023 19:41:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: spear: Remove unused of_gpio.h inclusion
Date: Thu, 15 Jun 2023 19:41:58 +0300
Message-Id: <20230615164158.25406-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The of_gpio.h is not and shouldn't be used in the drivers. Remove it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/spear/pinctrl-spear.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index 18de2e70ea50..b8caaa5a2d4e 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
-- 
2.40.0.1.gaa8946217a0b

