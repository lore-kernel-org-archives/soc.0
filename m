Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE9CC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 18:16:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBD16100B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 18:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BBD16100B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P8FpG6D9g0SiTVB1mcHgXyMB97PJB2GSLyk4N2oV3aY=; b=YT9PTpMLet5Ebl2/FIoKuqGbbM
	uVRx69wh9/G55aRKeWfsntxnGbwnM9w7pZrL0gpn/9v8HRYrKA6qm+38ZQyMCSsTOxAH1yhp95ZQu
	xHquFyY5zWMu2BrHN3hDrx9bVWqxZUKtUW9mCph/+rlyND5qSwJFCIBFroiZF4pXKyle6u1P9Cz0M
	QQ5Vp5CtTR+7reGJ4EZFYCYoaaq4t6YHg842Ys1nA+wkFLRG3XeKgQPfqsn9bZFDS/GfOsRAP2EJN
	WBpPozuN2aI/E1l2KguGs8o7UlZCxtN0zDqpi+EImqlUoihyKBpw4kfnrLCa/B9GA8tkUc3n+YTEs
	6PfDBebQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUver-001ITb-SJ; Fri, 09 Apr 2021 18:15:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUve7-001IJR-Kt
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 18:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Or1tK9HRB3KQNvChiWt3O31v+NN9OAHgu01LXwMc2rE=; b=YZpl4/e/7k6+NgYvXxcnFxlp9d
 SX7zEGyHrJlkyz3uHmUncWKbREjZ4SGUVcRvnrr8zSvwI/f7u+gO4tYJW9j+Ak5bdq1x1EIo3UAYT
 NalXk24gMRr0rL88r2JnDzGU81PjK6AACHIFStjV4rDLaAM79s+JLl8E5vNe9PIiNANKPDeXKg7VF
 NqXs/KS3rUtxY3R1vbW7MC7Ll9gtuN3ODI916dm8LCPfaNyDGB5e9zUJZ5XP3TnrtGuSNTsVA/90J
 j0aq4Tqwifn/xbm3cgOdHEEuoVfmdcHacPtim3Iia4DBAMMaxE37bXglxqGG8OHjmGyX+8D3MevOo
 KrIxhewg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUve5-004ihn-1W
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 18:14:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso5206265wmq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 09 Apr 2021 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Or1tK9HRB3KQNvChiWt3O31v+NN9OAHgu01LXwMc2rE=;
 b=d8nSmwAwu+/P15/V96M61k+B124zIEbFXUvb/o7JHDWoMoFyodtCI3fnK2OHdayyCS
 1k+pqy3tn6iq+7uZ7eN1dTHkI9hWCby/eIw+FKu4Zf5KRi/dR9kkoR+xj0Baaz6lxrLf
 g6ACzXyH2R2ZvT/aPmWpgoWPn7qjf3aPv9bnhm2w9CYdpMmqNyIkMduXP7XFn3S9Ae59
 REiCyGZcFgJMCL/AHNsPW4fJYXfliZYzp2u3/Uyk/HnHlD3fhxmymW/dBV3fBCC2+4fl
 r5GqK5aHx0rC0vOST/jK+rMtDeCdnOsY0W/yZRSgJdRBSU6pcajFpKVBxPORPF+Kvigg
 PAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=Or1tK9HRB3KQNvChiWt3O31v+NN9OAHgu01LXwMc2rE=;
 b=M5eMPhHY/Y9vqV5P0NkqlRtk6UKqMHniNh1U/+tpVZRLge0ranPX/omrQKEFm6xek+
 a8ti0w0O+fq42MDoM9ql0ogu8DuTux5d9Ck3XN1egFAWHhiO7SD3u/Q9HzikX53daJG8
 Ji8/IzclNjzre59gjTN2WORwnRhm2achw8G0kKwQ3OVX4Css2sZkuHuIe6uRU+3zv5W3
 0KcsQIs96D3bb6snjm+EnS/h3Qp3GDXGUKhZYTR9NLZ1IEoigd90wmk7wxAdX7HRcxh9
 ZN9mX4AzjubSwqDaBP4J8Qf8ASi82RWmfBQoTOBeP7mdsEvcID2u7FCQHsPsjz+dOy+S
 8b7Q==
X-Gm-Message-State: AOAM532kmOduR03fXgMaNjkyhMwlbN2mvJo/e6IwbrcUGFinpSgr/Vjr
 cLyk6V6JKXbAM6c8QsLWWMkExQ==
X-Google-Smtp-Source: ABdhPJwK5iJwFYOpwRwE7cKLsbES+nMkx39eAGhXrTYONmE+NA9Q+4NGhxlu5OFSft/UtZfYg7kZgA==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr15034595wmh.69.1617992055134; 
 Fri, 09 Apr 2021 11:14:15 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i26sm5290791wmb.18.2021.04.09.11.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:14:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic: updates for v5.13 (round 2)
Date: Fri, 09 Apr 2021 11:14:12 -0700
Message-ID: <7htuofgwaz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_111417_092597_17A6B972 
X-CRM114-Status: UNSURE (   8.90  )
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
Message-ID: <20210409181412.01AthK6ziYiMQkuJps7BdnaPzP8Ytq9XpHX9-eQ9omU@z>

Arnd, Olof,

A 2nd round of DT changes for Amlogic SoC families.

I'm now aware of the new DT warnings added in the first round and will
work to get those cleaned up next.

Kevin


The following changes since commit 727d93ed3ba67307a82c3ac5ebc7e335265e8b9e:

  arm64: dts: meson: add initial device-tree for MeCool KIII Pro (2021-04-05 15:35:39 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to 412c8fa8c3748cc0500b4c86a47dd28254f015f1:

  arm64: dts: meson: add GPIO line names to ODROID N2/N2+ (2021-04-07 09:18:41 -0700)

----------------------------------------------------------------
arm64: dts: amlogic: updates for v5.13 (round 2)
- updates/cleanups for Hardkernel Odroid N2/N2+

----------------------------------------------------------------
Christian Hewitt (1):
      arm64: dts: meson: remove extra tab from ODROID N2/N2+ ext_mdio node

Hyeonki Hong (2):
      arm64: dts: meson: add saradc node to ODROID N2/N2+
      arm64: dts: meson: add GPIO line names to ODROID N2/N2+

 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
