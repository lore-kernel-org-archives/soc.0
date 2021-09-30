Return-Path: <SRS0=wDPU=OU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FC9C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Sep 2021 02:57:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C4B61368
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Sep 2021 02:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30C4B61368
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x7C4CJCS3HAosLJgRJkZjgIkgpe4VIi3PL9+N8DNchQ=; b=Nv+eTZT1IEawE4
	Nwm/4G/Lf07F30nENNp/6Y2MU6QKJZ6vO82OWIEl0SzFAE5kzOYIb+xfnrAHO/WWOz6Nix2Feifgi
	xPPU++iYR9wcx747icKioyz6mynMbkUOItEAZbu9wtIIB5DCM5euzKOPfNKjgkErFO+XO3vVFSY0j
	+w0UaYdGpED5N0p3Doo47PhYFlmEBlxKL+XQiWNH4SLx0YBzPX7VJI1M1v5+4zrbcJpCxSMVd+c+4
	Zl/3T/50kzTQRaQ4bBVjuCUY0IObT39cyCfCrPp3a3oibIagkhStHLR+aE0Z/KE9y602rzkb3lVH1
	Kz/nP94mJuUFc8rIxJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVmE7-00Cqon-QL; Thu, 30 Sep 2021 02:55:15 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVmE3-00CqoE-AA
 for linux-arm-kernel@lists.infradead.org; Thu, 30 Sep 2021 02:55:12 +0000
Received: by mail-oi1-x236.google.com with SMTP id e24so5476684oig.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 29 Sep 2021 19:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+1ST1IwMq7SdLN8IVWaHSe9jzpTADx+oCW9sYTruZ8Q=;
 b=hDRMWj4AyHsqYsMPUVFDfAJoc/59eTDFl+JDDVqRnSLT8YLgzTsoSQgDThD+hvsAF6
 vy/5x4rZjFMg0fec/cc1gzn6KRxIGE/4dPLWGCRb4fmBsT8UKpt9Tt1Kl7hWUH0lLNjs
 CD5wPz9FHeseaYWEQa51a4XLgo5LVpGiTlYPxe5L3xZqBPoRMP8hAd9NVTE4WWEuoLeu
 tAaDKApIfE4wJk5paOKCh9b7ciAfSX37AVxvz/52zs7oO4GxT7PKpxQ9t9HKGuQRpAkK
 DPNPbA+aEjI4F7xlLLT0jJvUgHh2PvtCMc8FdK5Jnq9mqaTVPStvz33LviCPG6pI5Vxq
 ge3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+1ST1IwMq7SdLN8IVWaHSe9jzpTADx+oCW9sYTruZ8Q=;
 b=57xI6mHcD8tML5k3MZy0sAi23hRLjGGNuJcSXlxkCisd3kRP0A0nmCs5iL05sIf943
 iuzlePSKAD9H3hgKBEp74pCwCHj9pgOOsYEokk9K/x2AuYtf4TXRlUepgXYnCQbdsn5N
 UJp6CRrvGbvyRHWDgbmur10zRFtBKivOTOgu7C6oMRhzibgT5ogwT0VIry0WVLIErVU6
 hvqds4LsdhF7XLPQspCRXA9xWrvfubd09HsxLXlTHkY9pm8IJY69oVN1vQwjYbX1SMt0
 eOXkQP//9rQjNrTn7pb6r6PeJgN2LC/KQisPJPVZDsrKaXyzyA8X01BOJFNyimy+lNen
 Nbew==
X-Gm-Message-State: AOAM530c8HMzaZQQPjwY5ivob20a4zVy2lFKoHVB4JipMIvgBp/3TKck
 ZB/q7ItWBZBTHWv+Nxx1b03LeQ==
X-Google-Smtp-Source: ABdhPJxGDBULmmB1HwFnluqAi6juGLR+lBmZye4slIGlDBjO9z62aUEnz9vq2OafqnFVDQO58Conpg==
X-Received: by 2002:aca:c641:: with SMTP id w62mr833261oif.102.1632970510404; 
 Wed, 29 Sep 2021 19:55:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z17sm350459ooz.38.2021.09.29.19.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 19:55:09 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Pundir <amit.pundir@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Shawn Guo <shawn.guo@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS fixes for 5.15
Date: Wed, 29 Sep 2021 21:55:09 -0500
Message-ID: <20210930025509.1091-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_195511_389215_1715053D 
X-CRM114-Status: GOOD (  11.98  )
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
Message-ID: <20210930025509.j0eNcfC8-wfbGnJIWBsP_8pTZEVYKiJ6PUz5PfOdL-Q@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.15

for you to fetch changes up to 1878f4b7ec9ed013da8a7efb63fed1fbae0215ae:

  arm64: dts: qcom: sdm630: Add missing a2noc qos clocks (2021-09-24 10:05:22 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS fixes for 5.15

This starts by reverting the SC7280 CPUfreq update, which was merged
before concensus about the associated drivers changes was reached.

It then moves the reserved-memory changes done to get IPA working on the
Lenovo Yoga C630 into the Yoga specific DTS, as changing the memory map
on the platform level did break a couple of the other boards.

It fixes the HDMI audio on Trogdor and add missing Aggre2 NOC qos clocks
on SDM6{30,36,60} which prevented some boards from booting.

Lastly it enables the PON module on SM8250/QRB5165, as the lack thereof
is blocking automated testing in LKFT.

----------------------------------------------------------------
Amit Pundir (1):
      arm64: dts: qcom: sdm850-yoga: Reshuffle IPA memory mappings

Dmitry Baryshkov (3):
      arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
      arm64: dts: qcom: pm8150: specify reboot mode magics
      arm64: dts: qcom: qrb5165-rb5: enabled pwrkey and resin nodes

Douglas Anderson (1):
      Revert "arm64: dts: qcom: sc7280: Fixup the cpufreq node"

Shawn Guo (1):
      arm64: dts: qcom: sdm630: Add missing a2noc qos clocks

Stephen Boyd (1):
      arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link for HDMI

 arch/arm64/boot/dts/qcom/pm8150.dtsi               |  4 ++-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           | 10 +++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  9 +++---
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 15 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 21 ++++++++-----
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 34 ++++++++++++++++++++++
 7 files changed, 80 insertions(+), 19 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
