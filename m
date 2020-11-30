Return-Path: <SRS0=XW8w=FE=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E6EC64E7B
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 19:01:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0E6022073C; Mon, 30 Nov 2020 19:01:27 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBCB206CA
	for <soc@kernel.org>; Mon, 30 Nov 2020 19:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJMTNQNk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADBCB206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f178.google.com with SMTP id h3so15322873oie.8
        for <soc@kernel.org>; Mon, 30 Nov 2020 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me9gvmdPdwgMfYqBMx+yVMz/ZeJC/Y9+hXpy6aQ553A=;
        b=YJMTNQNk8EBuk7v+Q8deTWkmAdkaNkxsQqYjsnb0/CF3KHidap5KK5YIgsT+/96pYo
         GI9hmAaxyP38uxE1Gq0K8Jcbvaa8N+VDNMaet4EtFsSkieG5T/i1o3JK51LSYs7ES4QE
         kUtHwhOWr4P4rJnmqwcMyqpv7SoeCw6J2q0NuM3HXF3mvs/A43pk2kmNsrXtzm7+H674
         42O4WZyWfP/OGUCB2dxQDsrgZWxI8UX1XNWY0ca8TQmXz7P0IinUlIQOn7wV5eVc79tM
         LfBLMlq7mFUyP1OcfUlYp1NLyimWKbJ3jIvKqW29M2nUlqt/dVNFlbEaMoii6K4vNfeq
         tvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me9gvmdPdwgMfYqBMx+yVMz/ZeJC/Y9+hXpy6aQ553A=;
        b=NjdlKdRC4UKsS6lyUglD1sa9ICuPf0zvfmVd2fHWgo7lhPM1xR8DBx6WJXm3FqkwBX
         5E/5koK7uU/hTGs9Kvtll5inaMpzcY92E39D+/HDVZ0vPUYhYyzYoedksnaKEh5iEJlP
         /yWqNnby3VjNCZcd7SN8YCufPq8jYk8INQKfw2Nz1un7IdEifbyzxyX9TSgYpTnpbby8
         WFd4WkZJgB5KIWqX+sLLy1HeKYPeIh+25Q93w6IW1zD6nko41WAedfV7JQkwErFGmor+
         qxlm5YBXuZy6ntj/B1IrYHeQbQ7TVLI1z2+IcCYalVbYoLDpJkoGTzG1HZaI4TXldqTH
         4eAA==
X-Gm-Message-State: AOAM532vuXBlQuRJGQToto0UtSeWuSbBMVboigRK/UmURkk5zZHFrjyo
	+hSQRaiZgamCzEY8ic8KNk9lBg==
X-Google-Smtp-Source: ABdhPJzC9294BlXXSNgQYq5DzHAxdgvl/ZPN01BPL6WXHog337osmyLN7doZQIFdqjCHeVDSxuUN2w==
X-Received: by 2002:aca:3dc3:: with SMTP id k186mr235780oia.156.1606762885498;
        Mon, 30 Nov 2020 11:01:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d13sm7027930oti.74.2020.11.30.11.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:01:24 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm defconfig updates for 5.11
Date: Mon, 30 Nov 2020 13:01:24 -0600
Message-Id: <20201130190124.345127-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.11

for you to fetch changes up to cc563f8f769b9fe4bbe18dcd3cbb382a49cf3585:

  arm64: defconfig: Enable Qualcomm PON driver (2020-11-24 22:28:47 -0600)

----------------------------------------------------------------
Qualcomm defconfig updates for 5.11

This enables the Qualcomm PON and OSM L3 drivers. It then ensures that
the QCOM_SCM and Command DB drivers are built-in, now that they have
been made user selectable and tristate.

----------------------------------------------------------------
Bjorn Andersson (4):
      arm64: defconfig: Enable Qualcomm Command DB driver
      arm64: defconfig: Enable Qualcomm OSM L3 driver
      arm64: defconfig: Enable QCOM_SCM as builtin
      arm64: defconfig: Enable Qualcomm PON driver

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)
