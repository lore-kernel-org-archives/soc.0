Return-Path: <SRS0=87Mx=G4=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6D7C433DB
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 23:24:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AB16021D93; Mon, 25 Jan 2021 23:24:14 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B7C227BF
	for <soc@kernel.org>; Mon, 25 Jan 2021 23:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B7C227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f172.google.com with SMTP id k25so2522422oik.13
        for <soc@kernel.org>; Mon, 25 Jan 2021 15:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxEcU6b+RmfdibISUxArgxsBfCRGKrvIT+AEAVhb/DA=;
        b=xAOnjRjaC234JB+z/tRn7AjkeBS3vgpqdr/mD37Hnm2zzKhZCx3e5Q3D+kNZooWqP4
         XUSlyGhEy+msWsgZI6ksdiBDeYiDKg6yZGPxAvk9yKhtCa9HYOCDChORMy/1iHvrE0ub
         hFzpr2ZDULt3p4UyS9N7unl1tjBidMVlfDr1qOMd2c7zLAXKf5/b2sZ/5cc7kC8/uluf
         nZLHQKl8gYGISZC+caolK649i8Gs9OlHquJRPIAMBuAwv7VlzzZDK5qlXhdHJ9UBqPSe
         0X4KJtM6aTnRkDANGiVof9zcZCMgYAfzfzvjRpgsuRmaZ/nSQ+3c+my9hoH8851VSB5F
         6aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxEcU6b+RmfdibISUxArgxsBfCRGKrvIT+AEAVhb/DA=;
        b=LnPJdgJTBhUkH7CeZextXsPo960c9Bu12vn4LTT9FFK3XomwnODbzJOqPHXqIGrvlQ
         /FTVSR5zdT1hlakjZYBXZz6iJ9mjLWIiIT76aaMc/qJwsDp4RNjls0i3sgt0Ax+on1Hm
         6hCKWMHaU4sy5MgwzZ/1aBi1La5wf7r6Vp/8dU599U5uuMep4mWTlor5h5aQrfW/bl1F
         vC09/NbQf1YS/l4Axb7/ZnnpO3aChpnpb/gPVOH1fURcMylTs0I6288UcrVuAMbxZWLx
         6VhXeKHqfeGwfSzJF7Dwu5kbFHawAiN7gb8glpgETmsdrE9rxeccs5+9Rpf+Y9bVZY5W
         ri2Q==
X-Gm-Message-State: AOAM532gD23AajEBqTNbMj+Q/lrAw2+776JWr+DOBjArWNSOnHc29uam
	hq/BZkSujFhoh8tRpNC/zsNcZg==
X-Google-Smtp-Source: ABdhPJxEaffWeUuF51yZPFUPw4waATGBvom/UkEbjzaK0d30+T7sFUeF+aViZv0adupAKmFWzkbjkg==
X-Received: by 2002:aca:ab08:: with SMTP id u8mr1536302oie.84.1611617053440;
        Mon, 25 Jan 2021 15:24:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 68sm3759386otr.16.2021.01.25.15.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:24:12 -0800 (PST)
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
Subject: [GIT PULL] Qualcomm ARM64 defconfig fixes for v5.11
Date: Mon, 25 Jan 2021 17:24:12 -0600
Message-Id: <20210125232412.642834-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-5.11

for you to fetch changes up to 5b5465dd947cb655550332d3fa509f91a768482b:

  arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin (2020-12-30 11:07:32 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig fixes for v5.11

Devicetree patches for SDM845 introduced in v5.11 requires the
platform's interconnect driver to be buildin, or the kernel will fail to
provide a valid console when we hit userspace.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
