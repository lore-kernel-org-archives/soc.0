Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BC6C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:23:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76CE64DDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76CE64DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EhxKD6FDLJNtIiLXrHoLz6pwbxRsYOmuGGhevLYahbA=; b=2+g17qiISqBjAr8pN19dt1HNdw
	jTGb9cW29dXBTvP/XFIvgJaTj8GewVpQGQV8nGE+kihcXDGp5sgo5BFogeoXSKXDHF8KRUh8Kux8g
	/OFMLeP2+pCoI23BqGPkX3Qk/Cu62brWkVDRVAllgCtSBSYbCz8PBJV8XemaZwONw10eUp0J49vN4
	bGBJU+YkAcV6K5AlBtMUNXEWUZfE9U39I2+Y2fvwVVDv3/9F2iPzyI0J2RK9dOYe3RTXr9oyXNXwv
	/QQSYOfPo53mb+hmtZF6L2/SIPJv0Z8Eo8q4q8FzCkj3XRAsc2BhezR+oCXy7B6Vw9xnMxMYBNlxD
	NjIGJ5Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7X6I-0004wz-DU; Thu, 04 Feb 2021 05:22:42 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7X6F-0004vr-In
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 05:22:40 +0000
Received: by mail-ot1-x32b.google.com with SMTP id t25so2279550otc.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 21:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNhjejt95hLlQiht+V60b6s/E974FjQJnxFYdOCYRnM=;
 b=DlwUkuVf8orbvgDKQ3JiFiCFhhM03z+4fon31xQD9E7LR7lhDRcydiyfIP+RzBxXH9
 CFomCtcZ8EbliBh3JC0hjnr73tnuePIP1zQmYMHp6aHeqER0siPM1muyQEhOl/2QCWx8
 p+aRjMfafNr2AQC4HegZJ/Up3hQ5iALsYLe+Lis7DNK6VToMAxeVE8rJG974vkj8nnF+
 dXi1OIPCUpZbqvO3Rh3wYwM2CuJDIMeZzrTaaK7loyYyJ7Wo858hSRG1PdEq4a3femrI
 n3mzolNijWn6BGD5nVjm4DJ377ivV4DjZQsqKDZ1Thk5G1wqgj0WBdLvsQbAbJY4xkJ0
 CELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNhjejt95hLlQiht+V60b6s/E974FjQJnxFYdOCYRnM=;
 b=BYxm7j8cd5rvj+KgYLeXTWozIisM0yuj+AP3Nx6ZhXBCcMkt0ZQmDFniRqKx30a9QQ
 RGpsV41I8Zsmmxo2y6VZCjtn59u6bsw/YH7r4kV4odSLVEi5ofX5jn2/JinJ1o5+7Q4L
 aJsal6MukuMLg2OHr+aZq+tn0btZQS5YtKuyyG0y0vF5vl4DNBxNPrB37CXeMwK8DHVc
 D6XFNPQuyvKh6IMvBOYL7GPfCF40EIBjf7RWXnLh4CX0JqFssHjaUOLbfJZsN2vkac1v
 VnVpxu6ZgH4sDDu7KTdB+ok3o2aZHmlYwyh3HwViim1kMnMCTIdiV8O0GIwyswSzHSGt
 F9pA==
X-Gm-Message-State: AOAM530ZG4w8wuKJDpQjtY7PswDG8zuwcwlCW/WZLRG/MRiayvdEtCw7
 YRUGwcX9Umovxt1Yzzsu5gRkkQ==
X-Google-Smtp-Source: ABdhPJwRk5FvjI2WqtUWF/xkdj1I5szZZNy6I+YTkeIM7qbNATHuL7tJDSF/ybx+XIOUR6VYuML9UQ==
X-Received: by 2002:a9d:4b0d:: with SMTP id q13mr4581587otf.325.1612416157957; 
 Wed, 03 Feb 2021 21:22:37 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id f6sm922390ote.28.2021.02.03.21.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 21:22:37 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm ARM defconfig updates for 5.12
Date: Wed,  3 Feb 2021 23:22:36 -0600
Message-ID: <20210204052236.388783-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_002239_945217_EA3EBD61 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204052236.nWhzsVS_ZlQv9UwBVCqz9b7UJ1_z1yAqOO6L2pUC9Bg@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.12

for you to fetch changes up to f147d717b133bbecded354b28afff9f2c3e9164f:

  ARM: qcom_defconfig: Enable Command DB driver (2021-01-22 13:50:47 -0600)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for 5.12

This enables various device drivers found on the newly introduced
Qualcomm SDX55 platform in the qcom_defconfig. Due to kernel image size
constraints the qcom_defconfig is used instead of multi_v7_defconfig,
for now.

----------------------------------------------------------------
Manivannan Sadhasivam (13):
      ARM: qcom_defconfig: Enable RPMh drivers
      ARM: qcom_defconfig: Enable SDX55 pinctrl driver
      ARM: qcom_defconfig: Enable SDX55 GCC driver
      ARM: qcom_defconfig: Enable SMEM partition parser
      ARM: qcom_defconfig: Enable MTD UBI driver
      ARM: qcom_defconfig: Enable UBI file system
      ARM: qcom_defconfig: Enable DWC3 controller and PHYs
      ARM: qcom_defconfig: Enable ARM SMMU
      ARM: qcom_defconfig: Enable RPMh regulator
      ARM: qcom_defconfig: Enable watchdog driver
      ARM: qcom_defconfig: Enable ARM PSCI support
      ARM: qcom_defconfig: Enable RPMh power domain driver
      ARM: qcom_defconfig: Enable Command DB driver

 arch/arm/configs/qcom_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
