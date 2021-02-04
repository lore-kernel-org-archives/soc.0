Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43957C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:24:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFCD064F55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFCD064F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/lA9VhPy+sP/U8H0aIbT6qYnYqRrR6i5eM9afLaChM=; b=A75ycelfqeI/S3rDLUYrHsjJ3d
	IZMbMAh3N0tCSBi018dYAD7sFQ3xZpGFpnQiYw9o+QhYVGyWdhtMDAACrRp7ItWKAbRpMvhZVmmfw
	qX1o2Waf8CUie42Von3kp73u0r7xRZsQdWA+j0b8o9J3ZKvK4Zn0YYe1KM+/4yKImAvzkVZRWhiK1
	Pj/TYMwc61AalVm3MmcVjEnNsYi8sosKamrSjZJL8Hjl4E6nfwZK+aMuUCmh2UQZsafB2T1bTYJm/
	GYKGjUr/Mu2qnOyJEadQoY06iBn1uvn42M4cQt4bcDCIH+KvuhsaGjpvZ9stvm7VaK0V1BlgvlNm+
	b0aMDkHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7X6e-00051l-1I; Thu, 04 Feb 2021 05:23:04 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7X6b-00050c-Eq
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 05:23:02 +0000
Received: by mail-ot1-x32d.google.com with SMTP id y11so2302657otq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 21:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdzXXZfVky7bYs1orc7IE9J5miYIkRPeW5sycyboBg4=;
 b=uVJcATAX3yR8sE2iv4IogQa2vjXQZmYJD0O0xkvyPwuEv3zpcSiA4tnXqAL4K7nzWv
 Ue1FamtLQDRenEvvpPTUOl0Wv24mQOMtu6+DrAiMPc7wxZPEKTpojIkKYXi9B9kZx6Q4
 igaisY69MdQ/lbxC3gJ8KCSizPAPP9s/nDHAhqj+3O5pwDEL/4veR+CLTu7nfRYtRSNt
 y6xwWZXVqzPan1s99Y3NF016EGPYpS9Gp/JCGAZKJpmeklwWbODeT7O4Hhs7a3YB039X
 JiS5DVp23Y396DYG/ptmdUcwFIbJXRasuBcE/iHTznHHuw0xaWPWZLReNFR6RpvHG23v
 gTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdzXXZfVky7bYs1orc7IE9J5miYIkRPeW5sycyboBg4=;
 b=BLJVS/0IqWc6X5gj3Oo4Hlu5pnPJVEvFJXvVyTUwbUajx/xSPA668jsrzEW4V9qcht
 80YG0Ucw8ZWwkkwksiaI5OgOy6DVtoQULHm7sCqTIJ8EkYzIElNHV+jA0FdzqcGQcOVj
 ktRMKHM9xHRxf6hPIflv2o6wellwabbte23xn5FcH7pF1EhmKhfwNI5DN1tMSUG5Sikm
 33UxqpAa6gWJUmKpYLW7J/q3KjGYNTVi+cacinMtjMfxZSja0BMp0oeWvQASyeUEb/An
 zTscVInXxj81WE7HJf+f8HqsEggAh9KrQmteFhi+Vg7gQMO88czu5+Azc6lnVwGFEu7J
 mfhQ==
X-Gm-Message-State: AOAM5327cO0CI4/iw63nNiQxpXB1JAXo2bi576pf/P5QlYmPXhxgQVky
 L0rARhxTRoSRHFuC5o4kZ6xzZg==
X-Google-Smtp-Source: ABdhPJypjdhXu0KOvBqfelMNks1LQHuv1Qj7pBpGFvYqrFrTANF7iRIX7aiVoacmiEWCNBaIO9FzVg==
X-Received: by 2002:a9d:21b6:: with SMTP id s51mr4448172otb.13.1612416179580; 
 Wed, 03 Feb 2021 21:22:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id b7sm934193oib.53.2021.02.03.21.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 21:22:59 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm driver updates for 5.12
Date: Wed,  3 Feb 2021 23:22:58 -0600
Message-ID: <20210204052258.388890-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_002301_523475_771D99E4 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Lina Iyer <ilina@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Luca Weiss <luca@z3ntu.xyz>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 Colin Ian King <colin.king@canonical.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204052258.Ek8LxHYBEE3YDVS7f3IiV0pV4s8L-kXsmhe1YHqthlY@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.12

for you to fetch changes up to 01f937ffc4686837d6c43dea80c6ade6cbd2940a:

  soc: qcom: ocmem: don't return NULL in of_get_ocmem (2021-02-02 15:39:13 -0600)

----------------------------------------------------------------
Qualcomm driver updates for 5.12

The socinfo driver gains support for dumping information about the platform's
PMICs, as well as new definitions for a number of platforms. The LLCC driver
gains SM8250 support, AOSS QMP gains SM8350 support and the RPMPD driver gains
support for MSM8994 power domains. In addition to this it contains a few minor
fixes in the ocmem, rpmh and llcc drivers.

----------------------------------------------------------------
Andy Shevchenko (1):
      soc: qcom: smem: use %*ph to print small buffer

Colin Ian King (1):
      soc: qcom: socinfo: Fix off-by-one array index bounds check

Dan Carpenter (1):
      soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()

Dmitry Baryshkov (5):
      dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
      soc: qcom: socinfo: add qrb5165 SoC ID
      soc: qcom: socinfo: add several PMIC IDs
      soc: qcom: socinfo: add info from PMIC models array
      soc: qcom: socinfo: Remove unwanted le32_to_cpu()

Konrad Dybcio (4):
      soc: qcom: socinfo: Add SoC IDs for 630 family
      soc: qcom: socinfo: Add SoC IDs for APQ/MSM8998
      soc: qcom: socinfo: Add MDM9607 IDs
      drivers: soc: qcom: rpmpd: Add msm8994 RPM Power Domains

Lina Iyer (2):
      drivers: qcom: rpmh-rsc: Do not read back the register write on trigger
      soc: qcom: rpmh: Remove serialization of TCS commands

Luca Weiss (1):
      soc: qcom: ocmem: don't return NULL in of_get_ocmem

Manivannan Sadhasivam (2):
      dt-bindings: msm: Add LLCC for SM8250
      soc: qcom: llcc-qcom: Add support for SM8250 SoC

Sai Prakash Ranjan (1):
      soc: qcom: llcc-qcom: Extract major hardware version

Stephen Boyd (1):
      soc: qcom: socinfo: Open read access to all for debugfs

Vinod Koul (1):
      soc: qcom: aoss: Add SM8350 compatible

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smem.txt     |  57 -----------
 .../devicetree/bindings/soc/qcom/qcom,smem.yaml    |  72 ++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |  50 ++++++++++
 drivers/soc/qcom/ocmem.c                           |   8 +-
 drivers/soc/qcom/qcom_aoss.c                       |   1 +
 drivers/soc/qcom/rpmh-rsc.c                        |  24 ++---
 drivers/soc/qcom/rpmpd.c                           |  28 ++++++
 drivers/soc/qcom/smem.c                            |   4 +-
 drivers/soc/qcom/socinfo.c                         | 105 ++++++++++++++++-----
 include/dt-bindings/power/qcom-rpmpd.h             |   9 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   3 +
 include/soc/qcom/tcs.h                             |   9 +-
 15 files changed, 273 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
