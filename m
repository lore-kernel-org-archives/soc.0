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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5886EC64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 19:02:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF022076E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 19:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wEKQVCBY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJMTNQNk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF022076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+s+uIzM9W9I8jlKIckFqA0Ln9+mXy5cOMwoS3Yvp7cY=; b=wEKQVCBYzhWBG7c0pf3aP4fZ8K
	ApEFLRF8xpEdAUs8rerSZUQbApAWv2oxc9kUbl0Q2DIniPVVpRF27D1lGkxgq8EyghBDbzh9FXcwO
	FWZ0LsWYNxP/5+zigfId4PvOmPVemTB6Z50gMbOInlZlexHCgbrw3PqxlxhnglDz5EgmMIxDrppOo
	gtZX/kKYPdh+Nz5qXYP9OpOj4Rent87k3sF+4duy5ZuIUM9p8byZzIfRdSo0a7h3OErzVyaPpcN9J
	hysA4PGAVxoXtmSmwhdM/lJ1nQiww4stkprPDwx9PQy7U2a18/jTzlAcRmE/dwYWnlrYLQ4nVZDEg
	SAg3nIvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjoQV-0007oi-0p; Mon, 30 Nov 2020 19:01:31 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjoQS-0007o8-7c
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 19:01:29 +0000
Received: by mail-oi1-x230.google.com with SMTP id y74so15311178oia.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=cmqT9tuLSXIZGWB8aDKQ3Xd7SB32SPqX/4s4WLBASekIuokFFYH4G1KYcZ+UpLSpqu
 J3EzD2o3k7fu3CiWLghMEzLABUVWgsBKQqpYZDF4sj4IK36YWiLzg3TBfD8ZuUiWMnoB
 l/ZMa1m3TXRtVDgqtRzcVJL8g2M61X9fjOvE0Ww1d8EbUB5WqwFnKN3DDXOqvy8zY6N+
 pWXJlTZ8bnifDkQg4pWlUz7xsGDHZvg9gDT7K5Eu6omrZZbRGFGMqcSywGCGqZizLfwZ
 TiSEpjtTp6ywoTNy/2IysWnSAGJGHJ4MJtWX1cQHVCgtYDxekU27Fa1aUNjLpwQXXyGs
 hyFQ==
X-Gm-Message-State: AOAM5335eoVStmDKjGxhXNhwji54lt+l1YcHaHG6voDBm5RFGZ3SnhCW
 J8cnp1qfXudFKbbiPntkNs9CsA==
X-Google-Smtp-Source: ABdhPJzC9294BlXXSNgQYq5DzHAxdgvl/ZPN01BPL6WXHog337osmyLN7doZQIFdqjCHeVDSxuUN2w==
X-Received: by 2002:aca:3dc3:: with SMTP id k186mr235780oia.156.1606762885498; 
 Mon, 30 Nov 2020 11:01:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d13sm7027930oti.74.2020.11.30.11.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 11:01:24 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm defconfig updates for 5.11
Date: Mon, 30 Nov 2020 13:01:24 -0600
Message-ID: <20201130190124.345127-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_140128_571089_0F8FD840 
X-CRM114-Status: GOOD (  10.15  )
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
 Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130190124.1cHjTW179-STryQJ9Uhx_3km5WYTuREUb6SjN-SH8xo@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
