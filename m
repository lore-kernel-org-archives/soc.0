Return-Path: <SRS0=YheT=2L=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B571CC433F5
	for <soc@archiver.kernel.org>; Mon, 10 Oct 2022 04:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65B85C433B5; Mon, 10 Oct 2022 04:11:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77583C433C1
	for <soc@kernel.org>; Mon, 10 Oct 2022 04:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77583C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id fw14so8868353pjb.3
        for <soc@kernel.org>; Sun, 09 Oct 2022 21:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRNiX2YBGFaGbEOW9EW2m4IMgeIOR/vpdS0qnuva6kA=;
        b=XWjcevQXwJ689afJUD94+6DLRPa301SxsBfqSn9+7DNTRD49nXgJJdFOUu8xZK9Pf1
         DU/KiC0GiL5EylVYuQPsH4Wi/no9QwcRROwZABJJLZPg5pydzhJZBUkuAX3t/H+sI6Fk
         2pV1a1mhRymiCLqfk6Vh0SbCqG8L0KK8dpxAx8iZCzU7GjHB1DL1R8WfpZwoti/bgrzN
         JOAUa/LUXLUVy3E02VOmz3YA/ct2YEbCnmuyOPO++eEwc8uu/3Di7EOUTw0xM9ExbRTQ
         eiFcqr7nMaSGAs5HxMN0MIE/R8vlAAWXKBnscgYa7n4xyzaSsN2BqNUTTsHjOQbozb/Z
         mrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRNiX2YBGFaGbEOW9EW2m4IMgeIOR/vpdS0qnuva6kA=;
        b=EJOe87YzgxoWQ2XLjn4c0ZLld0+WtAmo/6GZP5xikmJsfBIXL9bzmP86CpsifCOfTS
         7VTUWbDTfVAXAKrcEb1SI4m/IWskB5StabadGwJM5IXDBMpPbU9nkYHx7C/F7HqzsUD0
         qfFnekrAyYV1/qbvyJ7hOOwe6VrgA2awna4X8LvmBmpirAR8uIb7UcAW+UARDdayH4La
         /1t64//g6wIk+ezlquTulykswRwoz5GiRAb5o9IDSAzCJeMylFtgs8m4OaqB25+5li40
         aOIcjcCKzFnqbluih09twO2buedHSr9XHCIuSIlL7GQEanmyq0HMpisCf/k8we7ZyuLH
         knAQ==
X-Gm-Message-State: ACrzQf38gXlau5yfyC6PFQDsyqA9EYjzmAxqzgst7PrPD0NhY4dJRdXd
	D1Ee+nJglAmiDDo/Z70tQhU94Q==
X-Google-Smtp-Source: AMsMyM4jJikAaITTAHASRrm9j75yPxdyU/MK6wS0mYulFpYaLBuEsRB9ClYyW3qkQiQDYoluqnSsbQ==
X-Received: by 2002:a17:90a:e7ce:b0:20a:c658:c183 with SMTP id kb14-20020a17090ae7ce00b0020ac658c183mr18818066pjb.5.1665375071917;
        Sun, 09 Oct 2022 21:11:11 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b00176c6738d13sm1863104plg.169.2022.10.09.21.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 21:11:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ARM: spear6xx: Staticize few definitions
Date: Mon, 10 Oct 2022 09:41:07 +0530
Message-Id: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix warnings with clang like:

arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous prototype for function 'spear6xx_map_io' [-Wmissing-prototypes]

by making few definitions static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Rebased on v6.0.

 arch/arm/mach-spear/spear6xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-spear/spear6xx.c b/arch/arm/mach-spear/spear6xx.c
index 58183493e06d..7a5fff134872 100644
--- a/arch/arm/mach-spear/spear6xx.c
+++ b/arch/arm/mach-spear/spear6xx.c
@@ -339,7 +339,7 @@ static struct pl08x_platform_data spear6xx_pl080_plat_data = {
  * 0xD0000000		0xFD000000
  * 0xFC000000		0xFC000000
  */
-struct map_desc spear6xx_io_desc[] __initdata = {
+static struct map_desc spear6xx_io_desc[] __initdata = {
 	{
 		.virtual	= (unsigned long)VA_SPEAR6XX_ML_CPU_BASE,
 		.pfn		= __phys_to_pfn(SPEAR_ICM3_ML1_2_BASE),
@@ -359,12 +359,12 @@ struct map_desc spear6xx_io_desc[] __initdata = {
 };
 
 /* This will create static memory mapping for selected devices */
-void __init spear6xx_map_io(void)
+static void __init spear6xx_map_io(void)
 {
 	iotable_init(spear6xx_io_desc, ARRAY_SIZE(spear6xx_io_desc));
 }
 
-void __init spear6xx_timer_init(void)
+static void __init spear6xx_timer_init(void)
 {
 	char pclk_name[] = "pll3_clk";
 	struct clk *gpt_clk, *pclk;
@@ -394,7 +394,7 @@ void __init spear6xx_timer_init(void)
 }
 
 /* Add auxdata to pass platform data */
-struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
+static struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("arm,pl080", SPEAR_ICM3_DMA_BASE, NULL,
 			&spear6xx_pl080_plat_data),
 	{}
-- 
2.31.1.272.g89b43f80a514

