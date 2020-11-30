Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBBFC64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 19:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7490D206CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 19:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p6r972wd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFDs0G0d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7490D206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SjRv6IwBIAgLWI7EJr97nnGVkW2eqjR88Gq3OJO/jvY=; b=p6r972wdljixgWxJQzHL6s+e4S
	IbBZlA8VGHkGE4FrtQTvuH+7k3lzqFKPzDLJkd8zAKko+/hTWZAgW4I19Tzi78rx6lRWSnpnqgzxt
	4pRak+hU6j1HRhIH2KSJzTtNO9YaViIiojN3AmCOKQjsIOg1jtF869mssOFowSst+9fS3OaSF1MmY
	aHkUobkJ0Z8YAdtq0hW5D/epr3PQV7E09NAcyywawlS0ISe+BPHa+4nNWg/N6eaRi5oghg9ilLDP4
	gylTh5ywsb9AAK/v5nD/SidWS6Pp2YB4erWfwTAojvF1bk0fOAN7Z4zhByVTqRldvuJvhy15Bm+tz
	6SIAgWiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjoR7-0007zH-MD; Mon, 30 Nov 2020 19:02:10 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjoQr-0007uH-24
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 19:02:00 +0000
Received: by mail-oi1-x234.google.com with SMTP id y74so15312781oia.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 11:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFP3MCLy2EXZUBJtiDcAGWbpBsgwcvmKdFz2JF0dZBo=;
 b=TFDs0G0dDo8pJvrVvUZgEZ6YWnppxEFXN1bNY3taZwE/f6cs12KRXZP5OM2KSMSQYB
 kf6uXtYJmWM69CACQCv0+vzpgsKzGrwJBYRWeztj8CETIrCJ7ET7wjIZof+SsggZ0IoE
 R1sSPqLf2lWSn5QWrPLKDRKInJdIT+3eY1kFQXNcPTmZr0enG8qUKSAiU6RN/n/jGvO+
 vlrUKTIICxiNhkcZftLAgFPxx8T4uuKaHNwBvU6N+1hp21c5uBzCoJqRh2LnKv3fTgCi
 aiXu2lppvwXFlHtTU+Br9Rz+bk5d+hRAPqHJNi5VSqlTrJQBe5SFI2Oy2pzYsb6UK5vg
 iJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFP3MCLy2EXZUBJtiDcAGWbpBsgwcvmKdFz2JF0dZBo=;
 b=OuB7xbnvnZ1uOB2Mts1FFaq/LacP3tRQn6ydFW0fS5/vgYqidQqHuMwQPt8YjhYH5u
 nWtLTva2Ii9lv8YmRLfWy3oW2y3xSr54tfAGUZaMYIGqL91SdUksqoJvkwLAyB02522U
 C+Pxgr0/DMHy76EP8DQJ9G6hv0Ve94p8wllvpLvtjNuvPnSskuJaGm1mIk/13ToIBLVF
 /b5ps4BUzN71LwRCHTJe4O22QRMYtPRlqqOu7Tq6i/UxqDl3aGXpRJt9vJV6oR7s/UBR
 bWxO5gaLpJpanipAyqubF7Tl9nSw1eE10cZPVEMxMDmn/S6C1V414ouLBjvZOyW3Fk5w
 /cXA==
X-Gm-Message-State: AOAM531JcbY9bdmYawOF7AtndU7A+NptKtztFXpRFxTx0BE+/uEWNypl
 zDshqyvQ5ihSpFXrdDoc2elcqeLMZZxP5A==
X-Google-Smtp-Source: ABdhPJzBrobmA5HZtxJaMUTaf8v8ARuqGjgOc7Dn7ZiIprGRmFJesvN/bfb+4ePcxWJc1r+u6UsK6A==
X-Received: by 2002:a05:6808:a87:: with SMTP id q7mr205963oij.81.1606762909698; 
 Mon, 30 Nov 2020 11:01:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p12sm9098717oti.35.2020.11.30.11.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 11:01:49 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm DT updates for 5.11
Date: Mon, 30 Nov 2020 13:01:48 -0600
Message-ID: <20201130190148.345302-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_140153_165844_D1E6F076 
X-CRM114-Status: GOOD (  12.72  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Kathiravan T <kathirav@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Iskren Chernev <iskren.chernev@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130190148.2WfjEkz2YNLlvbUYrVRhtPIfu4EkmTcWkc8fHgJXUzA@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.11

for you to fetch changes up to 74ab8ccfb8f3133acf8b2a2a7bcfba9c1710960d:

  arm64: dts: ipq6018: Add the QPIC peripheral nodes (2020-11-30 10:46:28 -0600)

----------------------------------------------------------------
Qualcomm DT updates for 5.11

This adds support for SD card, WiFi, LED, touchscreeni, touchkey and
fuel gauge to the Samsung Galaxy S5. Nexus 5 also gains fuel gauge
support.

Finally IPQ6016 gains support for the QPIC NAND controller.

----------------------------------------------------------------
Iskren Chernev (9):
      ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
      ARM: dts: qcom: msm8974-klte: Add support for touchkey
      ARM: dts: qcom: msm8974-klte: Add support for touchscreen
      ARM: dts: qcom: msm8974-klte: Add support for led
      ARM: dts: qcom: msm8974-klte: Add gpio expander chip
      ARM: dts: qcom: msm8974-klte: Add support for wifi
      ARM: dts: qcom: msm8974-klte: Add support for SD card
      ARM: dts: qcom: msm8974-klte: Add fuel gauge
      ARM: dts: qcom: msm8974-lge-nexus5: Add fuel gauge

Jonathan Cameron (1):
      ARM: dts: qcom-pma8084: Drop incorrect use of io-channel-ranges

Kathiravan T (1):
      arm64: dts: ipq6018: Add the QPIC peripheral nodes

 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  25 ++
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 340 ++++++++++++++++++++-
 arch/arm/boot/dts/qcom-pma8084.dtsi                |   1 -
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |  16 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  41 +++
 5 files changed, 413 insertions(+), 10 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
