Return-Path: <SRS0=UjyX=ND=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55976C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11E760F35
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F11E760F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xi6ERajsXqiDlUGpC3G/kRaYUQ+s/czWwr7x1eBxld0=; b=rzOehOjTGx8sGp
	EH9QSk8Aimm5SdgcUIPSdYs/7TnriINHuIdx6fPInX2Qib1vhWug3uIUfjqK+qjNb82KhHgZ5zwtX
	b5dGNfoaF5WWnvEUzJJf/oFZLDF8pA4ZI4yfLmmVC3kdkmpnkmkOdV9pPRCXgJVsU+V+YKDoZX49i
	bLYGUz45/oDvvquBSN+jy+ZrqxbDyeB64B7TbH+M6S3fIvTAL4/pLCVzZNyi6N9KyasaLskIZSSdo
	QeuuiPy0POtkqsSFZNHSDPIw92sdvy7Ns0FSkkKmW4NzxLJnngzRdEGMdw3bkZ2u33GYXxkqIWMid
	TmXIaQ9msUpgR4K5NbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHve-00BK8O-3E; Thu, 12 Aug 2021 21:07:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtt-00BJWJ-2M; Thu, 12 Aug 2021 21:06:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7839F6103A;
 Thu, 12 Aug 2021 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802364;
 bh=OGDIeApfqC8Joka7WYJErUv0ZmCZiuB0zUmzx9K00gg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hOQ/MbxM+8ZUCvwedCiyMU+2eguLbFwo6djyOyWQeUAptNmUihcmFFG8V9TgE7lhd
 YIItxQkESyOx6bK1QsLGqyczM++PsTJVEPPqlKE5Nf7AFq0L0OBH1YHdA/Ir6bQ+sk
 Q1XJ6zutnWLi4f+i8E6ZfpJgxpBMRsKTcrCQndy/WTevGJzsJA2zltRTWH2qO4LfNi
 tu2B2yKY3qezOWND/s4jAqAqxfrQuDskSM0rRn9B5nnvyNLJcm8GVAt3TxPdWli6aB
 qfvwCpSqGfzoic1bdn7BSFOn1wSLCQtrTGdG8p2oJnebKLhhvk3SJ6SRhSQV2Lpxkb
 5ogoPjJaZ9n2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, arm@kernel.org, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm: dts: amlogic updates for v5.15
Date: Thu, 12 Aug 2021 23:05:42 +0200
Message-ID: <162880206165.1376011.6655305408575524550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87519792-c9e7-76a6-5db5-0e955286b564@baylibre.com>
References: <87519792-c9e7-76a6-5db5-0e955286b564@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140605_172386_7C0F35A3 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210812210542.g2lfTnk2Kv50x8MZJblvJ-7uHg7pVY1SppeBuOIx2zw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 09:45:21 +0200, Neil Armstrong wrote:
> Here's Amlogic ARM DT changes for v5.15:
> - meson8: use a default higher default GPU clock to solve probe failure
> - meson: add AIU audio controller and codec for ec100
> - meson8b: fix pwm regulator supply property name
> 
> Neil
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c2632c3afead6e4c6208f90348d142ce1bb372a2

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
