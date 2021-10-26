Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278E8C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 13:51:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC17460D43
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 13:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC17460D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cH4bjUWwK3n4DG/rwI3VCHAf1AxQ4nFGBsQ8LlGYfw0=; b=o+83t+Mvf225uM
	2Ofvpa6nYqj1icAp+i/6JEAxRlCi7X23H5p1r66wJ3GBLAMpEZuFXh91hj10ZWg9HXUDntq2S13Xa
	7FTM06Wofsd8aq1gAR/Q+3DLZ2CDQg89CnP/Lr1CdCMjwU9Tg4JC2zEi0LvMlL9Z59XSs1MKx8sUg
	Vyh0r7azoCBS/TJMC6oJDJdjXM5QJI3SZiew9dvTM3KMw64vcP4E/qvtg16FlC/s0GJWcbV10t4nP
	wKBwgZPNoW+QHizo49WSZpOTWzZkskz78pLkDOrsVBGc/jIVmgxxQSiUyYfYFFKzSt6j1ATui+RUD
	+adycgu6ykyqEcVQ/wdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfMq0-001wUL-2o; Tue, 26 Oct 2021 13:50:00 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfMpv-001wTf-H4
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 13:49:57 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 107-20020a9d0a74000000b00553bfb53348so2173610otg.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgcgUi0aKzGvNSZ/upN2vDxathxvZMJpdDJTs+D3GFg=;
 b=ilH9IDaXEJChoPlap7VE1xIGKJT0kcBhQv8CLpxuK6nnI5KmOgZOH8vfMubcxAc4vy
 y6p5NmEjcZQOhXrSwuyuL25IP8XOh/rogu4+pdJiTacRwqkNxfNtMK3Dox8IiJYrSnBc
 vfa8YwreJu6Mr2LFioJX61AJjoUwseK3akxaU7CylDvEyH2IJ5hTfQnwMAFzJI5Tuvig
 O0sbm3X90FYZR9JhZN1deD5rZgIMvPqdC1KRCvD0rhSa9VviJH+w79L8HOn6ctQtj0Kw
 eu08NB+CabcApEHrR57Rn3MGOrRmcxmsWKC6hEBfkqyWYQN9pTlcjVVcFzo1vLcSG0PT
 8a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgcgUi0aKzGvNSZ/upN2vDxathxvZMJpdDJTs+D3GFg=;
 b=Ly8tR7z5yaPIHGOSHVTfGqn9tov3iUUsXHa8OWaD+L6PyUEIKnWNbDzEA5EEJIEEvB
 kbbldXyLY4UirGiCnP8ZurNjrr37piMzYylHMsvdquAcX4x075upOhR3J/zlfGrV0t+m
 cCuWdK6qLncDz4Ci5gEHJQ6imFKA4BmbCiOzeFQ0eIaqHaqM9cVK4q6LZb8Mt+tteKRb
 e5TE2+U+1xPUAdqMKmhGxJcxTzcJy3wgyGOl3QV2AI6fcdv9Av9PsMfB+2opWGpUvvYj
 aoA1VPxGEM0G4gNuPaJkJAB4NKzcAJrIrDfah+qiiV2I2uBe5AXeJsiUNSNT6Hp1q4VO
 oYxg==
X-Gm-Message-State: AOAM532olix7yOaF68TiwKqg0c8SHEyVx3wyZy0QW6/tzTm9QuIPcJJ2
 6LGu9AvLU3nAFzRWnY9OVv87eA==
X-Google-Smtp-Source: ABdhPJx0vq6FZnYNI9ja1HEk+yhqXMevPwQk6aw7o0kPhZ56uvsWFUomcnLFC9klJi5kKxyFnFGRcQ==
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr18797941otf.103.1635256194482; 
 Tue, 26 Oct 2021 06:49:54 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id c17sm4767607ots.35.2021.10.26.06.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 06:49:54 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Maulik Shah <mkshah@codeaurora.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.16
Date: Tue, 26 Oct 2021 08:49:53 -0500
Message-ID: <20211026134953.1204327-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_064955_646605_78F1A38E 
X-CRM114-Status: GOOD (  11.60  )
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
Message-ID: <20211026134953.6SVACRUJnPLJoOg8FwY7w77HKekRxq81G51TiHApyXk@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.16

for you to fetch changes up to 2da521272ad3bba2019dd1a610261d99d62401fd:

  arm64: defconfig: Enable Qualcomm LMH driver (2021-10-21 09:41:00 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.16

The major change here is the disabling of the firmware loades user space
fallback, this is done as arm64 is the only platform with this flag
enabled and as a result doesn't play nice with standard distributions.

It then enables the new limits driver, which controls the hardware based
thermal mitigation on a range of Qualcomm platforms. The prima/pronto
WiFi and Bluetooth drivers are enabled to ensure these features works
out of the box, now that the last details in the dts are landed.

The new driver for acquiring sleep stats is enabled to facilitate the
various efforts on getting these platforms into low power mode.

Lastly the base SC7280 drivers needed to simply boot this platform are
enabled.

----------------------------------------------------------------
Bjorn Andersson (3):
      arm64: defconfig: Disable firmware sysfs fallback
      arm64: defconfig: Enable Qualcomm prima/pronto drivers
      arm64: defconfig: Enable Qualcomm LMH driver

Maulik Shah (1):
      arm64: defconfig: Enable Sleep stats driver

Sai Prakash Ranjan (1):
      arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect

 arch/arm64/configs/defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
