Return-Path: <SRS0=LxLS=PN=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBD1C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Oct 2021 20:12:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A211E603E5; Mon, 25 Oct 2021 20:12:15 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDCC604E9
	for <soc@kernel.org>; Mon, 25 Oct 2021 20:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BDCC604E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f48.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so14036401ote.8
        for <soc@kernel.org>; Mon, 25 Oct 2021 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vA/CE8tf842bYqq8xkTI5gJmfVh7UR2D5fj0Mld4W6s=;
        b=HgciXcK1j11C3WxpCUFggFy42vlLBbDqPAH8m/VUMHP9glyYYXAF1orhW+CdfObMSj
         wk7G5OC+Fy79xi3J4Vn/owoj74VwCoxe9qNpy0vDODL02E0h9JBq8/r/n2IM087M9C1D
         fWjrkgvPJlroPmE5AvcVmR3axTOCuwMlOEyQta6+3t8rH8Hp7SXdixuHPLRZ3CUSICMz
         B5+Dt1UqbqXcVaEUPkqL2nC12A/dK0WjeFNsZtLSgUcdjyoNu4GnxDy9BF1YPxe9iJ+3
         t5WdSSKs3ufgvUsWXLVFOGP+Qq8Rkk3eMU6CXE4blXrlL4WE6EE75Qia9fo2K/JKRSOJ
         C8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vA/CE8tf842bYqq8xkTI5gJmfVh7UR2D5fj0Mld4W6s=;
        b=LAEuPL+QNXKI9VguXh+YvKCVuZAi2nUYD2O9LMDc+E6e1y9gfPL9pCgMgisx3biTDB
         tz9wDcqsYKfR8DAMCVUS5EgmS96ow05cCLS6KsMT+JRcDo/qCllCXGANLTTdfzmT7iQ0
         dcGsu7Fdv0l3MSxo6tR4iE63Kyi7sVrO93zj85xdGjzHUUbAo7KcuYV0G+3qOw2klfiC
         dcFXxrh3ov3vp0bjGJQBMGbg6MC1PtZij2SFwAST5Dxf00ZQfDLwbmJa6pQCDzQK021o
         0//ndl0Dfu1UCB2cho2ESduw00YMVVQc1UnlYSutjuMNDaeqkLq0gdGS47aHWb4W4/U1
         ipfQ==
X-Gm-Message-State: AOAM531U035udGTZspUJk18hwv9I8E2h0OoeWsXUTtO+Hjip3rE7SWFn
	UGVYri0lSDV74HId1ym6KlT7EQ==
X-Google-Smtp-Source: ABdhPJxq+gvESjkG+CE4IiqKiokANqUfFi8wFAY+fGKV2JBeSFGrVLYJWNB03zZZvt34VIw7q5yLzw==
X-Received: by 2002:a05:6830:1c64:: with SMTP id s4mr14998879otg.174.1635192734647;
        Mon, 25 Oct 2021 13:12:14 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id v9sm3822211oth.62.2021.10.25.13.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 13:12:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS one more fix for 5.15
Date: Mon, 25 Oct 2021 15:12:13 -0500
Message-Id: <20211025201213.1145348-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the late fix, I hope we can still squeeze this in to make sure the
Qualcomm RB5 boards will boot v5.15.

Thanks,
Bjorn

The following changes since commit 1878f4b7ec9ed013da8a7efb63fed1fbae0215ae:

  arm64: dts: qcom: sdm630: Add missing a2noc qos clocks (2021-09-24 10:05:22 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.15-2

for you to fetch changes up to e091b836a3baee4c8b1423a969589196b88a9e06:

  Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target" (2021-10-25 14:26:00 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS one more fix for 5.15

This reverts a clock change in the Qualcomm RB5 devicetree which in some
combinations of firmware and configuration causes the device to crash
during boot.

Data on an adjacent platform indicates that this is probably not be the
root cause of the problem, but this resolves the regression seen on RB5
and will allow the SM8250 platform to boot v5.15.

----------------------------------------------------------------
Amit Pundir (1):
      Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target"

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
