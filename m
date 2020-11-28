Return-Path: <SRS0=CKL9=FC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6413C63697
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56FBE246CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="koGI4fsW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEF7WJXE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56FBE246CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V04zP6i9Dt1kkBK6k9aI7IMzi4VuMJi7eVG/3WCV7gQ=; b=koGI4fsWkKKvnJqapeDzyuSUR
	AGflhnRnKwoWJkMzfNQSYQdJ/D6bpNYjhUiC98dQCwHXqdQ8B//7mbn4s4oIpO5HD43BbHVnX2khW
	TgUoVkNRcCjKUSE1DpngdlCPBbWpO+HflbnrqxKO56cHy6MwTDGMDIwkndjHYEMKI9m3iOrWshsKn
	cdWwC1MFJ6ThukGoKVbVS0+XvU+59Ie7XRvqIWavcNvHvWlmaZOv/K8r/+jeFpe0C6IrxC+JgP/Jh
	K88tcsEu2LAMwiZRVm5wDZAeLuk4O75UviM0FznaxonFuCOQwLJ/Rz+vQWaQJeYZgqkGHe+uiFWHC
	KsiS2a3KQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj3Bo-0002Sx-4H; Sat, 28 Nov 2020 16:35:12 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj3B4-0002Al-2J
 for linux-arm-kernel@lists.infradead.org; Sat, 28 Nov 2020 16:34:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id t21so6783585pgl.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 28 Nov 2020 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+wcHMfC9e46l75/edznzeGWqfk7GC3EcwU/4A/2dBVw=;
 b=bEF7WJXEJothrpCAMY82PZQcafjT15q0/BykDXhEFbC+UySdoOPQZtgfKu2FCcHzGm
 YG8tTX8JTLlmGuA5y89WB7LTfWkdORMgLJbKtEdpADsnW6knAKbLpSz4ivuJKeeocu07
 BnZohIKXsFb4jlHjpkBmyR0NqspjMGTrW/hUH2gKAmJYpr6x76u/2sEzw9IVQrA9LcT5
 f1w16UG/lgf7AaQqhYH2/SL4NoRxt6JB2Oxmoi8bN6ZqRiqnpSHc4v+Bh9tTeh7bg1wy
 ViWmp7avM2KGTDOEGc5OikisrMjW+ipLakflKYcwMUAGczcvxXL+GamP4D741SBv7tmr
 jK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+wcHMfC9e46l75/edznzeGWqfk7GC3EcwU/4A/2dBVw=;
 b=IxbgBPq0E8CyFtFJY24Usi781wiudl13yX6l9jm8sbWS4LnhNbt5ek/BZOVt0NRM2r
 2/Z2PpcnfKA2pK4XhWn+uwaGtUkq8krGZuNQq5v6Uk8P+PUCvudHTxDcyzRBkYZyl8pt
 dVKIyphyxtrvbWYn3URVagK/O1cpPwtZKiThke3hLQHNa/Oe/JuNij8TBoYs3ebfCRb1
 QLVZohoYhC81fIYKtesrNd5mk17F2NLywzDsGtU7z0LzcIQCUApaIB4o03ZeJdGO9AHr
 Zux+Xz07BIOdkzULlcDuRVMW8tCSUaOQj93OWF5HJCFD6VTrMSJilzmcWsPbMa6CzGbH
 2QYg==
X-Gm-Message-State: AOAM530DSwQUJy+Z2sd1IXptOshRW1PriykbE29LO6wDNdzMfx1sueyj
 QDv22DiZObA5D7tfVmpA+3w=
X-Google-Smtp-Source: ABdhPJwCNbtf1bAnKuHk+EZfK4vuxIY5YZ/tbS8Uo1GHEG6oowtT30eUDilBSPln7NyffN60N/3BYg==
X-Received: by 2002:a63:b908:: with SMTP id z8mr10971164pge.396.1606581262559; 
 Sat, 28 Nov 2020 08:34:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 08:34:21 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 5/5] Broadcom drivers changes for 5.11
Date: Sat, 28 Nov 2020 08:34:10 -0800
Message-ID: <20201128163410.1691529-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201128163410.1691529-1-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_113426_229983_B3B11009 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, olof@lixom.net,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201128163410.CE1UQahLn3JIcCl_lKtu_cktFto8Z-bYKWSO3ib8YD0@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/drivers

for you to fetch changes up to b96c0546b5908268716ed9b1d39fc604413c630b:

  soc: bcm: brcmstb: pm: pm-arm: Provide prototype for brcmstb_pm_s3_finish() (2020-11-03 19:25:04 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs driver changes for 5.11, please
pull the following:

- Lee provides a missing function declaration spotted with W=1 builds

----------------------------------------------------------------
Lee Jones (1):
      soc: bcm: brcmstb: pm: pm-arm: Provide prototype for brcmstb_pm_s3_finish()

 drivers/soc/bcm/brcmstb/pm/pm-arm.c | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
