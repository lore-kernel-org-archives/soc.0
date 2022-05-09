Return-Path: <SRS0=1uXd=VR=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ACCC433EF
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 18:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7AEE9C385B8; Mon,  9 May 2022 18:22:15 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C82B1C385B5
	for <soc@kernel.org>; Mon,  9 May 2022 18:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C82B1C385B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id v66so16102153oib.3
        for <soc@kernel.org>; Mon, 09 May 2022 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ba1szbgkKAy0W5SiV55aftVom3JgiYLjQJZdVAaKJXY=;
        b=D1/Ozk/howOpLc9WVbkqo7Ir0/Dk87ZlKi4pIvmkZIxit8oBAWCh3SfQxUPiBq7PKj
         waG2QFqYN5YBi1RPpTalsFPAJi1h6YA5gQrfBhOzOrjXpDJL/d5PXLHTpfNM/qOoCzrv
         Nko3AmAIo7uGShcDPDhVQi0xUOHUX2Rjbe7KQlEkUH9u5bKiKebu1f+VD/IGt5LVdoUi
         vcwXLfTr6A1JDHRz6wMRpyxyFa5SZTzE6L7nlQ1vmSexEELRzuV7CXvLbUEsF0iDyD+1
         hcTJQWWM+io4ZK8FREdmC7ySGhHBURBc7TQKgp35sNVHxnwMHvhIHyS7lBBl3XbQymG+
         W1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ba1szbgkKAy0W5SiV55aftVom3JgiYLjQJZdVAaKJXY=;
        b=D6hjzSk6NaQXUTZpYNURrD8FMN8XlaZPr2oVZvNJDV6ch8BXkuQdg1fxYj+wRe1DTu
         Fpb+h+lnNXQSNNgBPra4cfoouZj6RyJ+P+hOl56N2hU0w3bzNYZbhdkNvLl4aOpBR9qA
         xRMFIAPGbVhfTT5BskJf7fGbzxPgG0Stvu2fWYzBJ0U0PITQnApFwRn5hgBclKaSoKhe
         nXAa6Yo+rVi0yHoQEqvcxzJBrYMGA02pBsKT/E39Jbpdnl9R7m8IvUChF29xhrTFGzV2
         tjZOKCJCWIBJeisJoCI0aq2CzX2M8ULq7Ed2qWqnlfHF+181HaRMxZHSMqQLRLU6DsXJ
         jyzw==
X-Gm-Message-State: AOAM532n3gIgE7u1JHP8RjMfBJKWDwIuImd2k5K0tEkDhEn8O9ieQfPn
	xbmhzuowVWPLbzHTnBE5noxboQ==
X-Google-Smtp-Source: ABdhPJw6R7ibHnE/ZnUa8QlxgSIPufu2ZwgCf+uLFvNa9FB2jHELKMcnzadLss78/JVEBYkvh061WA==
X-Received: by 2002:a05:6808:f87:b0:326:a1ed:9483 with SMTP id o7-20020a0568080f8700b00326a1ed9483mr6705349oiw.287.1652120533940;
        Mon, 09 May 2022 11:22:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m1-20020a056808024100b00325cda1ff88sm4658158oie.7.2022.05.09.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 11:22:13 -0700 (PDT)
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
	Brian Masney <bmasney@redhat.com>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for v5.19
Date: Mon,  9 May 2022 13:22:09 -0500
Message-Id: <20220509182209.317208-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.19

for you to fetch changes up to 889b94dbc5539c8c45131aeead6d5923508f535b:

  ARM: qcom_defconfig: enable debug fs support (2022-04-07 22:25:22 -0500)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for v5.19

This enables the Qualcomm random number generator and hardware crypto
drivers, as well as DebugFS support, in the qcom defconfig.

----------------------------------------------------------------
Brian Masney (2):
      ARM: qcom_defconfig: enable options for Qualcomm random number generator
      ARM: qcom_defconfig: enable debug fs support

 arch/arm/configs/qcom_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)
