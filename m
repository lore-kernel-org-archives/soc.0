Return-Path: <SRS0=+ow/=JQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6CBC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 15:18:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 226F861007
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 15:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 226F861007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HMAowOInRyBzrRJOj9cHsfie5Nady1F8y7y5+OfncdQ=; b=CeHzm3HHHUl6Tg6dvH9zlwC0cw
	hOhfTDax6OkEGyAkuBkeMo/lk6wWCZDvpYSAZlsN95LWfe2bMkUV7G9Q1twmWkuecScbGi3o66/Kc
	wSAHPBtwQ/LfDPrYYRmZC2HxIXoRuOupIY8LJU9NLK3SE/ocakcdZ16M3h/WjrO6cHOHC5WLVcOWw
	r4bCnRHIdXnubmdH5Cr8Iezxj8s4TmOPSom+g3Xz9yY96fO/7d6JCF7BI3Q2gijoze7SEeUAgnNSs
	cxor+JcUiIRNFO3ap8VYMkeQKpvh6HfPgtM8Z0aKyegdLC3hDNp07YzoE9xMp7A3xtHPkd2OZczui
	QHp2/7yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYVdo-00AAkv-5n; Mon, 19 Apr 2021 15:16:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVdl-00AAkI-8p
 for linux-arm-kernel@desiato.infradead.org; Mon, 19 Apr 2021 15:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hUYb55vbsiGQBbuSQ1a5tSdTpqWWWh8+qc/85QHpA1M=; b=Jcj1/V+MvoZ9TAMztKS+W/fRDU
 +DaeA447aOI69MLpLmdYOyanczZkkQUJZkJItEw6LT+5D7aJW5RSKsRDxT7enj3HAeLzmq57Q4P6k
 fpfSmOJPH3fAqoYbJPwqzWvD3VN/0WzDgY/q3ZtgM21tohY5lICF4VCLGuX2FsE/JkdFy8c7bL5hA
 68EstE3LPStELVijDe2RyGjbNj0Of6PQM2nNwlOE69jQYlfZIcsV/hEhdaxJsDVW8mzG+/oMeTlDX
 4dcLUrxxMCOsapTHeAEY+0FHd20H1RWcoLfoiTj2kAiIvWgHS2k9GePoHK/o/MrOWQjGl+aUXU1QC
 0jGBE7lA==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVdg-00BTsn-8f
 for linux-arm-kernel@lists.infradead.org; Mon, 19 Apr 2021 15:16:44 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so32888010otn.1
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 19 Apr 2021 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hUYb55vbsiGQBbuSQ1a5tSdTpqWWWh8+qc/85QHpA1M=;
 b=qK8ZVxyb1cccHQVc9o2z+qY7KHg0bcdEBOIfJh6IVdSgxKOiEU2kqIyTjdbE5SB1+g
 1lmzUiWqAD3t614GUtXyLoNnpXfPD8BJo1xAlvh77ialpsIJkzEzFw37QDaU6DsqWgd2
 pG2HExBwN1RO1ehEAw3gywro8qPl5gcr+MWNE/SVjdE7rAxBCnFmRbDvUBWuAusr4YXE
 LggGQ49k9/jtUmkItfjr8qmRyjEpuQ/dFZLUcmY9QpqlWr53SYki+JPgsxich089VHP8
 OgGupZnKFT/mxZ24myOUFqiUa8nRC4ulH3IbimiRnzNZKYc7HKNqwHCOweH395hJqDAA
 jR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hUYb55vbsiGQBbuSQ1a5tSdTpqWWWh8+qc/85QHpA1M=;
 b=IbuxQsaK6/9M+17620iDV/tofq5v+24ivuSsLaAMGlX5xuh26V8xB94xO9c9VidRUW
 bizBzUPHM9hteKNfeNK6i71IYT3gPN30aLhWavWbqV9dL2wUBLcneuycOOtr5KjTPyth
 AF+eJXz5a5P258L41vlsB5gDR7PB/SWmRfoj4Wzrzbqg631WuZNs6ScdkDvowNfejYY0
 9WFEC8poEh2s2UWs5Yczxyudq/iQvwn1olI5xsxs+p09Bt7kcR42dJLmpuIkGyG/ivGx
 ma2Hq7DtBGxXcE5Pezs75j4QKJd3bcPEBRu4RELOrsUFA089dKRwmatnsG3qDwm88wR+
 lnMA==
X-Gm-Message-State: AOAM531jU/ZUejlIjNznry7gt+OzTEmi3sDfFXF69HDwJnN1YyBY1+lL
 JFn6hqHYJEDoc0g5xu9nYOLi7Q==
X-Google-Smtp-Source: ABdhPJzuOipDCJfrbVe//1UzrkYBYdbiB7EsZv1E5ZmnOoKZR56/O11HaIo0Z7WFKLdEhXGyJhGeMA==
X-Received: by 2002:a9d:5a10:: with SMTP id v16mr15145401oth.187.1618845398855; 
 Mon, 19 Apr 2021 08:16:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u18sm3008660oor.15.2021.04.19.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:16:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [GIT PULL] Even more Qualcomm ARM64 updates for v5.13
Date: Mon, 19 Apr 2021 10:16:37 -0500
Message-ID: <20210419151637.861409-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_081640_348489_C4200F2A 
X-CRM114-Status: UNSURE (   7.62  )
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
Message-ID: <20210419151637.vQwa8QiaaXmWtLxaHehNvDgbVt3whqqejBVz_Hepd_E@z>

The following changes since commit 7178d4cc0702bfe6a7e0f21e37d6e3dfe8e40f11:

  arm64: dts: qcom: update usb qmp phy clock-cells property (2021-04-08 10:23:25 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13-3

for you to fetch changes up to 1b86cc7330895b11df0a7dc15fbbbef60be9f7bb:

  arm64: dts: qcom: sc7180: Update iommu property for simultaneous playback (2021-04-19 10:13:30 -0500)

----------------------------------------------------------------
Even more Qualcomm ARM64 updates for v5.13

This contains three audio related fixes for the sc7180 Trogdor devices.

----------------------------------------------------------------
Douglas Anderson (2):
      arm64: dts: qcom: sc7180: coachz: Add "dmic_clk_en"
      arm64: dts: qcom: sc7180: pompom: Add "dmic_clk_en" + sound model

V Sujith Kumar Reddy (1):
      arm64: dts: qcom: sc7180: Update iommu property for simultaneous playback

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts | 13 -------------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi   |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi                  |  3 ++-
 4 files changed, 25 insertions(+), 14 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
