Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532D3C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE6F611CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EE6F611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NZy5WveIDA1Z/Kj7Y0xIAfJwJV2laowT3sxqfH5W8dA=; b=xsgb8Pekr0hl44
	wVhB1QWyJWiBsGHK+fo9RaUecdwmf2Tita8E5bzr9pRESdJtubvlbgro5gQkQqXVuUitH23Ymmlth
	zxSF++MX00KM3YCQW+f5wQaX6eAHWTa2bSVNh6LB+Yqh/c9/mAh1efNTcUiY8TAtkD93zYcBB+Ejo
	GkAs4ziwgEZ/pl62Nwh3ErxV/ch4e1N3x0HXAtRiTZ4D0bdhtkhuzNtOhdWquriIiOGW7X8dkdpLB
	KDblTtzqpoiZTbyLMDo0Q9zE9Vd4KTINi6IgayrSCsfrTkNQh5zsIlOUeWnJyiJOyxr0EE/up7Lte
	D5TYMuUQjst4XPQAhzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsvCg-00GRJb-CT; Mon, 14 Jun 2021 22:37:10 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsvCc-00GRIK-FN
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 22:37:07 +0000
Received: by mail-oi1-x235.google.com with SMTP id u11so16042697oiv.1
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Jun 2021 15:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JEBptkwCOSVfqSHvIaKYeUu9NwMWSszSeUKl6IYxkPM=;
 b=LQ0+FxKPU0GcCXj8z0HjP7PW/fNiyf2DvV8s64WqkYvHbFUHvAN7abHeuT6tmfkP0e
 4xCh13e5gHGeoOpIBnFUtq96OTuF1VDYCk9mvNWyBbbXpcHnIL1bb/RjHc7FaH48JWQm
 fFcJDg/INY1a/hQA6LFmrkNEHJKq+QOWxHvRo7KkAGaA3hl4B760RcbtG04oNmX7zqZC
 Gcyk939ZWkVh97aB78OfOl+Jby0PyMb/w7HUK/aOZSFaOZNfn4LOWE6yuai6zA6buPLk
 qAoDcshn0upGJv/AcfXikXz5x4jOuJk004XPW4FZHE8JBSyEF2EruVNFS5uGJHybIb+s
 KOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JEBptkwCOSVfqSHvIaKYeUu9NwMWSszSeUKl6IYxkPM=;
 b=Px50mSpnO4K47KMTm+atg1JrR/5cNul4HY1QM3w6jPtYbJ6XF4FyTUsj9ROW2J+JDI
 MWpciYcyKOIS7eGcL+LC9WYSWQBG/PAwZk4WhGN/r81yhCd48KVTAHyBjgLPABxphplU
 J3LLZwz902Br8YBuHMdZIW10tqzQTywkJUpiEoHf+l60KI6SaRt8todsh2XX2U1r2Kqk
 wa0G6VBVYR+RSVekU05mlMHY/qHvdCeiHMCDY0RZcHFQMJ1CtxkIJcMrGX8b80h19bnk
 wQLvIObRL0DzscHV30yVwWud49kWFebY6xRdDmxeh8ino7Xab/uxX17ukPUjOiwKedF9
 HMDA==
X-Gm-Message-State: AOAM530IUgkYnjsv0fKsiASftuiC+6RmZvtHLceGMkdIJJCXA3Nd+yEY
 DM7lCggfCgsBttFKcnfMVjEqEeXeQ7L/gw==
X-Google-Smtp-Source: ABdhPJz9Ktvi6oY5qYq5IW9gi6GvArkQevPsTAWmPetaIOT4p2i6UwhCiFjxw1uJhcbUg/oa0SuUxg==
X-Received: by 2002:a54:411a:: with SMTP id l26mr11985680oic.65.1623710225296; 
 Mon, 14 Jun 2021 15:37:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id b26sm3670710otq.43.2021.06.14.15.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 15:37:04 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig udpates for v5.14
Date: Mon, 14 Jun 2021 17:37:04 -0500
Message-ID: <20210614223704.393042-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_153706_544471_899FDBE0 
X-CRM114-Status: UNSURE (   6.85  )
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
Message-ID: <20210614223704.hGcaQwKrbP96IMA1hjCW82ZpF95hGMP4r2O7taaSdNs@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14

for you to fetch changes up to e9cd414c1136aa31d34acc04c175bfaca4662f89:

  arm64: defconfig: add drivers needed for DragonBoard410c (2021-06-14 16:59:27 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig udpates for v5.14

This enables VADC, audio codecs and Venus (video decoder) found on
MSM8916 among others and the SM8350 interconnect provider driver.

----------------------------------------------------------------
Marek Szyprowski (1):
      arm64: defconfig: add drivers needed for DragonBoard410c

Vinod Koul (1):
      arm64: defconfig: qcom: enable interconnect for SM8350

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
