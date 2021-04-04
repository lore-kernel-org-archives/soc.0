Return-Path: <SRS0=86YY=JB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBB5C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:50:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56917611EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56917611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+imiwcVFuaPUSbfSWRZk6FWY25379PULedANZFtcWw=; b=e1mQxk/3tHrPodNl/dXpzIdJGm
	skPPiOIiiZ4/1sdwBaKTWPiPwumNgb8Kg1Hph/QytV9oWbU7p6i8Qn07qL+0iJmzHRulICpjyfJJ4
	N+whJy3Ws7sQqlhNVSITHYhSDkWb0ek4h0klviVh6Vym6EA+t8mQ2+kvXHG3k/4t+xNr6dSk5LMJf
	32IqdX4OlI/Y4ldKJcOJrtt6iQH81CZNBQGWw8IZqga4F0h2NhlxdioW6JdFt6lKtC5ImTM6Mwh9l
	YO4Y5AwuKHAMSBerJHRCTc9cr2QfJ5lPiXayODnoPj0UpHG6BrR5jXK/+6m8s9EKKInNzj50qVSIM
	wzXsJmzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lT5vr-00Fzaa-N1; Sun, 04 Apr 2021 16:49:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lT5vZ-00FzZR-4r
 for linux-arm-kernel@lists.infradead.org; Sun, 04 Apr 2021 16:48:59 +0000
Received: by mail-oi1-x234.google.com with SMTP id i81so9698236oif.6
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 04 Apr 2021 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tbpeT+Mek+XfamFPZmReFCDXJFtqrtaG9wtcXHbtspw=;
 b=m+Dn/sje6Lm6a8Ehtytn3lZkENyRULhfOhPDdgsZ5z5oYte0AnICLQSi4Bn5AdL58J
 +CoBQ9rs7KPatBG7fG7ZPx2mjLoSPG9Wu69hmQ4aHlNu/3WDiuA8GHZ9YlnnXqi03msD
 NJeibO4qVVZ9kILn5yHlBilZaKEr+nCuhC6VrRC2BBVgJNVLrto/F9ubLo71miMNh91a
 ZAnFBP6xLNBGfnC8iShC4eNZ7IM2XcAKsPTbhvjCkK52gO8PtlXhfmUTkXhZLdcyk1xW
 hNjOsUmFSN7nP1FTsI6Z5kJeHZ6pDR0PeF23x1Dhy77+eeZDK04njiNWvlu5F/r6bKXf
 Picg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tbpeT+Mek+XfamFPZmReFCDXJFtqrtaG9wtcXHbtspw=;
 b=ZrS6ILrPoBgOtBHy6EU29U5Duo/frPw09bag6fzN+cuhAbRTyDt14sQvsbeoPB/SyY
 WgZE27ECAF58JrFGTaLWo+VgLH0f6qWHhA0pbBT3irKbumTCA49tjKxKV7q2B+UKAwgr
 YpkRCPSieUSykIaclPlk9igfXg6Gp/38bQ0qkQEOYvP9rRImC9Bt8CK8WzJbAPFxwk2g
 R2aqDLxPekBiZrv6kVUTxbfo3TpnLvpH59/l118nGC1BEqJ3xZsZQPrqBtTK1pRDPPG+
 hPQeIat3V3j1XZCZiuK8dAWxW5Jq64iSfHAKNpbL3rjkyO0JK1OhBFpl/QWl5G77ESCp
 Av0g==
X-Gm-Message-State: AOAM530Mm4lvGpqfg0cXvG91/3veBfbSpn7ZDjRNsv2xSZe5yl438hJx
 9hBDO9Hbd2TcIgb/oelj/0bXmA==
X-Google-Smtp-Source: ABdhPJy3Mi64WupJ/Hgn5dxMjnN3uch64bKtgIU0ITOjLlU9jvRjq65mBzceXINQyD0eKQZUQgC1Pw==
X-Received: by 2002:aca:e0d4:: with SMTP id x203mr15938867oig.76.1617554923162; 
 Sun, 04 Apr 2021 09:48:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id j72sm2672556oih.46.2021.04.04.09.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 09:48:42 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig udpate for 5.13
Date: Sun,  4 Apr 2021 11:48:41 -0500
Message-ID: <20210404164841.712845-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_174855_249100_2CCC547A 
X-CRM114-Status: UNSURE (   6.52  )
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
Message-ID: <20210404164841.kqyCVCzz1KO7EDmYmprUti5_xLwcg6k4iHGyZQc77ps@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.13

for you to fetch changes up to 1a0252abb6ff8312f28d4d8bc2b115ffa9c5d6c6:

  arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC (2021-03-08 10:45:28 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig udpate for 5.13

This enables the SM8350 TLMM and GCC drivers, needed to boot the
platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
