Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358D8C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F036124B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F036124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QL8kDawn/YgJlPyjK7S6kBNXaglQ1JQFMoEmzJaADkI=; b=Vw+A+zNlPpuLee
	WGHHAdQ0x2z6arg+L9Eu/Fnh+RCufQ1x/ArZ3A/AmJBqugaX8pGTwPfiU+vJab7avlgnfzedX6Afq
	oWpxx7bn7pv5/eOmQAdX0o6GvtvIc8Xspw+sMmLJ4ZxHZ++PuRa0nuYt4NfAg0cr83bmRJv52p81r
	KUO3jkFgXAJ93gesOAPSo2Nwj+yg7yBy4KYNNvm6Ut1nTJWLj4YceAVnGInrK0D6siCLkm0Bmfesv
	PWURh3ygDAmsIz+pS376YuU1gcLBgsjEduiMBOqjDRNxjiWul+6zKB3QLXi6CiW4Tz57LQrshsPT8
	6mqO3t4ecUnU5qmjYVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsvFE-00GS4f-HB; Mon, 14 Jun 2021 22:39:48 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsvF8-00GS2z-Cj
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 22:39:45 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so6969791oti.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Jun 2021 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EdHc/AxSkP+B70QGXtT/aVMYWMcBsbv+TEZwsL21ckU=;
 b=mCb2TXDTwhE4FEtPNA/TpAkjiNGklA6mfl8axXo4tK525o5v+zfhoPrKoNzw/MXKNe
 z5eb+9p6ss5BpDJEccjK4Q+onsgxWc+bUHOnnYR9GN4as/c7C1easVB8kQVMtFIc+gwN
 9XeDq3olp87AqtVR/P7S90ILEEQAxpOJkDvXGBIarf//sMJIIkPLYZL9n1apNqQK4YTy
 NSobicHh2yUs8IzJaWQMn7jBJb8EUED9oiRXzBbs/2cyjJflPr472oMUhR9mcEQuBtyF
 cNawO38eIrt/e+3AAvesAkUWkjHkRfmtUDZEVHdlNWMH4osSwqaaTpc8CWu4lagZhOrp
 UoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EdHc/AxSkP+B70QGXtT/aVMYWMcBsbv+TEZwsL21ckU=;
 b=MwFCvDLy7kEATs0d6yFeBHwAUGfelWaigb418K8xhbIX0V38QZt3VpwG+G2tvIAI8F
 +xhf33j7gYoK+Y3wf3We6OBaC8WX1f4k8qPNqFMc6wyS0bTKGr8tA5HjjoHRWBK6rOh6
 vP8IUN9moplfSICzDCnIRO6D/N51iZ7obLVvMCzZNHuTL78z5i2Zv3D8T1HGUocXyyAO
 CvK0s2UuTB5qPr636p+kv/rftN4YfEfGlZOlKBfkWEgoX1zP35zw34dEd5sF4yN0BVlU
 8DJR0kJQDfh24XSf+LELCvZSLrUCQnKM6IPcx7RPpD7Z2PTW5elQVdOLnikvuWtPM/II
 E7bw==
X-Gm-Message-State: AOAM5331LORCJekLosaPtZDj+kehqsaUzSpl0DxZjTF/WkMO2y+uQ4ya
 t6TI4on43s/6H6/nNiYLWu8sUQ==
X-Google-Smtp-Source: ABdhPJyX5H0T9BOTWQ6nUh3uF2mKqVo3hx7K8ZqUddihisusNh3QjDfIZMhEGBGypewfXbeE+lgBuA==
X-Received: by 2002:a9d:6b83:: with SMTP id b3mr15358658otq.325.1623710321397; 
 Mon, 14 Jun 2021 15:38:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p1sm3423879oou.14.2021.06.14.15.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 15:38:41 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Jonathan McDowell <noodles@earth.li>
Subject: [GIT PULL] Qualcomm DTS updates for v5.14
Date: Mon, 14 Jun 2021 17:38:40 -0500
Message-ID: <20210614223840.393224-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_153942_471179_60E094B9 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210614223840.NJvaBCJtfCdRamqp5q32OBDCG-hqoAvuoLOAyNcIYa0@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.14

for you to fetch changes up to 2011fc7a8b5b7415d7cd885fc84ada88d37569d3:

  ARM: dts: qcom: Enable NAND + USB for RB3011 (2021-05-31 10:56:25 -0500)

----------------------------------------------------------------
Qualcomm DTS updates for v5.14

This adds DMA, NAND controllers, USB controller and PHY, RPM, L2CC,
thermal sensors and defines thermal zones. It them enables these for the
RB3011.

----------------------------------------------------------------
Jonathan McDowell (5):
      ARM: dts: qcom: Add ADM DMA + NAND definitions to ipq806x
      ARM: dts: qcom: Add tsens details to ipq806x
      ARM: dts: qcom: Add USB port definitions to ipq806x
      ARM: dts: qcom: add L2CC and RPM for IPQ8064
      ARM: dts: qcom: Enable NAND + USB for RB3011

 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts |  58 ++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi       | 425 ++++++++++++++++++++++++++++++
 2 files changed, 483 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
