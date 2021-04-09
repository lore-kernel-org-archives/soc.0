Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E2DC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 16:26:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971FC6103E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 16:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971FC6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FOou51JyxlhseVhhzItLUb5SsJyxrWAVh9SHH3D0eqQ=; b=GlNSlcyHg94rgz/DOo/f5FyumU
	shau6xN8slooICOkhiQ6yFrjwCrdFwDZc2vCcJHYPx/suMWRMuh7MgimjA4cpp8kCkTEcQd5aN5v9
	PwsNcDFiwuQCAw8gc60AhcXenKkozb1AAmTZh5BD5kV9xAqVng8wohFg9tEgdZ9pJIoYw9YNicm9a
	JwaJel1buuHxh0hR+898JTq+WtpqWhlPk2YO6+hcad+lXYzdp6rMg6hmTttxMxrEBSUDvn+fJVEEN
	qD4rSysmZD+mIh1Oz+vD4ZvAjMrQXMoPxLFytZ5L4JAN7aG/Lsrym+nw+hrVuIeToIgiXuW7xyfnE
	mZC0JzaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUtvW-0015wr-Jm; Fri, 09 Apr 2021 16:24:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUtvP-0015v8-Tr
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 16:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ByB151TUOSTf2AoksdIDlwnxayEzo8uelQVntltKUxI=; b=avDiuHEc1lnQEGkiaO0RIihVbh
 kX1qfwQRW1jEoyo7jCAZbsCnnAQMdndCq/4mGFe2NJEhmT3zHtY3dCKc9+fXwsjEAgq9WGKI56mtK
 1qwQ1hdm2/szAcknemncAyMrTn8TiYpEtWvQ3dfe1bTMNWXTzKrbRGniUSKF90v0TOXw1BFkye3vv
 tBa06pc2n0qOVyD75XJkIRcog/NuXdKP8/Da7gWX52276fvX6ytb3hk6/1XSFABRTXO+VIQ+mag2q
 JPcq9zaE9dOujUnK1E2PuUhF0fn4ciaYSQlPHXgh2bVdV2zWpCaIrmp2mWxj2CFOvUSlTE/fBpACo
 AjMO7OZg==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUtvN-004eNr-6T
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 16:24:02 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so6242469otn.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 09 Apr 2021 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ByB151TUOSTf2AoksdIDlwnxayEzo8uelQVntltKUxI=;
 b=hZgYtwqOtVrF1pzF5T7/4V/VIp2inE0KuoTdLnWgd4iRf/mGWlTnb1O+/de+6KxLs/
 3j8V6Zs8GGDzqDieeP04oA3ok9P5T3Hg2iPyDezkPUSe7BdkpvHjp1gIJSi7w1jn/qb0
 T1tUwRVkTlgOAcv6fnY3PeDxKJLskGg/8a0iQ6Fzdb3cTDuVhs+a/yNNhLxuIQk+jfcH
 oZpgIYZGHFCHK71fWTxNSuLo7aASY0zJ8P3/8FcgdP/QeAqiZ4fWeyfhko+cEM1rdrcd
 x1GgAmtBrNH3r/AsQPGmpw1krdptjojrNWSCvnuSI8sGcplmyHVSsNPtoLtAHdGv5uKu
 fBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ByB151TUOSTf2AoksdIDlwnxayEzo8uelQVntltKUxI=;
 b=iuNmWB9SDTRfhdY/NYMyGTjPTbTfnDh3dsowFT+vMvnZ/FlyHx5DaURh+ZYoVNnlY3
 QH9pTLGFZauZate34KSgKkK6BjJQJuVmSfcxOQCFhejaFAbA6i/hlA+bfcd9E1keE169
 +i59mD0qRcjDit+KkR5k9lqcl12WEe1ww8GUydC7vrHDjbAb/5TFFP4Z2PUFVON+Ug1o
 3SXkPTkEh7M3Wn6dkhPlyja8ZIu/XgisJzOWAiSyWJkxGGrcb4Tzn8A4vm9jyPCj52eO
 9LG00mE8NW0z4Q0KePIOIeAQjem5UQ3hMAm39wdR8BfgSnKAIDe5zsq4m+IjpKJ8zioN
 xsuQ==
X-Gm-Message-State: AOAM533e7jmpIJxGDc8kOtq1kDEIPnXC1TLboug6OjHv3OB9A50dn8aM
 DFIAtEqH+AxlzlxJ2vsUlPgljA==
X-Google-Smtp-Source: ABdhPJzQGYVHkW5E8c3uvfg8c4PpdRxpEzWwlO+LYuXEFyNGtD4lDGhOJhYs7GqhzECZsUTCwZivIA==
X-Received: by 2002:a9d:550f:: with SMTP id l15mr1059901oth.11.1617985440571; 
 Fri, 09 Apr 2021 09:24:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g21sm715196oti.19.2021.04.09.09.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 09:24:00 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm dts updates for v5.13
Date: Fri,  9 Apr 2021 11:23:59 -0500
Message-ID: <20210409162359.776076-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_092401_257754_DBE8DF08 
X-CRM114-Status: UNSURE (   7.78  )
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
Message-ID: <20210409162359.W9ZmaaAvgPHlC8E99rdo_7YGuOCIKRlbYJUwt8O_kZU@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13

for you to fetch changes up to 885aae6860fae1eed38f5cc1ac09a40e4896a38c:

  ARM: dts: qcom: msm8974-klte: Add bluetooth support (2021-04-06 11:53:16 -0500)

----------------------------------------------------------------
Qualcomm dts updates for v5.13

This adds Bluetooth support on the Samsung Galaxy S5, corrects the mount
matrix for the IMU on Nexus 5 and corrects the fuel gauge irq trigger
for the two devices.

----------------------------------------------------------------
Alexey Minnekhanov (2):
      ARM: dts: qcom: msm8974: add blsp2_uart8
      ARM: dts: qcom: msm8974-klte: Add bluetooth support

Krzysztof Kozlowski (2):
      ARM: dts: qcom: msm8974-lge-nexus5: correct fuel gauge interrupt trigger level
      ARM: dts: qcom: msm8974-samsung-klte: correct fuel gauge interrupt trigger level

Luca Weiss (1):
      ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU

 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  6 ++-
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 52 +++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  9 ++++
 3 files changed, 65 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
