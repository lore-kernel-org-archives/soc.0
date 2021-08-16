Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28952C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 20:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E154A60E76
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 20:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E154A60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JA44RBLWioeAPkVX2gXQ8mxqVPvvBA6NlsHS/x/SN2o=; b=viw8xCJVBV796G
	a3kJwXLa8RasgVpo1bX+Q26SFmUhSzjRqHSpmMw8Wp4ekUwLGQBM6TP2f0c87433tyYcSs5Z3ihoT
	nYHtvueCSywUymh9rvjoMWFGAw0Cyyz2BprS/yKVgDXGjpAtty7oY1c25RrFsGpWj5RLRYlupMjEU
	Z5NGXcuzlH6Xek84wm4zLHWXMRZG+ynx9aYZw1HTJ8GuJYr8SAYpncfc7tnj2ACmKBYb8PeEQjjBo
	FcYrdgsHiVCfnUMnhoph0Y9McLqIqvO0OJhXf8sgOQOpckcSzip+g8/Wg2ipJ58HQDKm1jkVbjhen
	tSK8yzU6m5oJxs/R3ZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFjZ9-000Gzb-1K; Mon, 16 Aug 2021 20:50:39 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFjZ3-000Gyh-DF
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 20:50:37 +0000
Received: by mail-oi1-x232.google.com with SMTP id bd1so21162587oib.3
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 16 Aug 2021 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kmoyu7jA1eM6PaqAOcqPLI/aOuRdV7qLJPPT17KbiDI=;
 b=q2X7wvK9pcvNaogEd8Ar6JEEEeqLAc7E6w0HPK+t067zJfM+lR5RYCvNa0ufdOm9U7
 lrT7RUoj5+bRra73kvYEhHmdFZJ7NsaQaHiIMG4SyAjhY67XFWowwcAawb/oCc1YlaTe
 0UP4uJvpykvX6JiKfjDlg1SZ4GvUgmCvwme1qvw8TJ2hGGdqDuLgYs3upXZbqXhdoJpt
 XcVDWBsqiQqFhP3L7LJpI+4jOYImeR+1voO9JgefRjio3F4YWty+Ke5j6MLugTZakMuT
 Va2reXB+2++OEZ7mB6WScN7RZyuiGbFID1UkDDvIiQT2YPatmpecleqFYqoWuwfbCjPy
 J6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kmoyu7jA1eM6PaqAOcqPLI/aOuRdV7qLJPPT17KbiDI=;
 b=jY/N88/f1WQnkUnHjawDKnGEDNa9SoTsEehMsVmzT0my56UJrYlOv5zUfxHXggLKWq
 V9mK8rMqxcTKCfxMfXWwMJLRWvA/llyuX7MijfBYzkktInwQ0Ma0qqAGjTTq0J72p66S
 blGiLrCX7RtR87s129UkkpU4becFnuSOgnLKGenQev3Sc2cqD3z/2Tf07svs8knfjrU0
 AFtIDpp/4Bw8nUhYZ+0xtZn+Cnv7afhuGHNOK2nwWyzTzdE8CBBzayh4hqFMi9Rk8kw/
 gL8XqpV+2YG9lrgPaUMr7oRATaEJtFhjN/9niy3bosHW2U0NtBoorvqjbx+xqguU/VCw
 hCrA==
X-Gm-Message-State: AOAM533LgmCA51vhxOjrVLbguxGzFgvBRIukUbMJxZMyhxZLtVYdjF43
 Um7ZYAroe2nGporOFNXEisr1FQ==
X-Google-Smtp-Source: ABdhPJz10oI7Rxo2X6IakrDLahBN9gbmx3EWQdxvFF72jJraf0Rg5G3BCec9uWhOKhrnWsYakPvOFg==
X-Received: by 2002:a05:6808:56:: with SMTP id v22mr570895oic.49.1629147031966; 
 Mon, 16 Aug 2021 13:50:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id i19sm26244ooe.44.2021.08.16.13.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:50:31 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Petr Vorel <petr.vorel@gmail.com>, Caleb Connolly <caleb@connolly.tech>,
 Sibi Sankar <sibis@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 fixes for v5.14
Date: Mon, 16 Aug 2021 15:50:30 -0500
Message-ID: <20210816205030.576348-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_135033_517439_24DF411D 
X-CRM114-Status: UNSURE (   9.59  )
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
Message-ID: <20210816205030.qETJkairuwk47iUQnuzt2EcjOhfag7hlEy4jIedJA6I@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.14

for you to fetch changes up to d77c95bf9a64d8620662151b2b10efd8221f4bcc:

  arm64: dts: qcom: sdm845-oneplus: fix reserved-mem (2021-08-05 10:36:04 -0500)

----------------------------------------------------------------
Qualcomm ARM64 fixes for v5.14

This fixes three regressions across Angler and Bullhead, introduced by
advancements in the platform definition. It then corrects the powerdown
GPIOs for the speaker amps on C630 and lastly fixes a typo that assigned
CPU7 in SC7280 to the wrong CPUfreq domain.

----------------------------------------------------------------
Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: fix reserved-mem

Petr Vorel (3):
      arm64: dts: qcom: msm8992-bullhead: Remove PSCI
      arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping
      arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Fixup cpufreq domain info for cpu7

Srinivas Kandagatla (1):
      arm64: dts: qcom: c630: fix correct powerdown pin for WSA881x

 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts  |  4 ++--
 5 files changed, 21 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
