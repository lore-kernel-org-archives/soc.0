Return-Path: <SRS0=f/o2=FP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D52BC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 11:11:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5AEA23E26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 11:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5AEA23E26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXb8O3sVYNF4Qrz2o3i0vTmFP2x0mT5nEfAWsahZNTI=; b=nJXb/mWJfZL+g+seWWweWPjbyq
	mG/lW+2C7hliBYUpXQkFcTvEQBMFabq+XtqFVawq2Gdt7p4J6JjmqZw8i7T9g/2mCWAlDD0FX75vY
	7dqhtR/0+AxdIB4B8HYpRieJeiV6zTu51Hk4yn9v/gjQTt03H8lDWUdPxpXCI2ARiWpktBG3Rzwg5
	YkfrHr2dgEbb4TecnlAP18IDZaLAZJYmwSoRjTuQjIdeT0XLHY4801R+fyskxGl132gy+xYskQKut
	O2OlgwegWnu9bAMwDfJn7mwL4WiK2+8AZ0n5tfIg4L5z+sLaQD1W8atJdZSXTz2qZYj+/UvupJ2N3
	brSHGlQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kngJ8-0001la-U4; Fri, 11 Dec 2020 11:09:54 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kngJ6-0001l5-9Z
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Dec 2020 11:09:53 +0000
Received: by mail-qk1-x72c.google.com with SMTP id z11so7988691qkj.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Dec 2020 03:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WQKg3cIi4hIsPZ9PKTpFROffzkUZwNMkNLWOKFleW9g=;
 b=aZcfuV+Qkm9nAiS4xpqiErZ/wAhNCH74SMJUU8MzxLIFNhVDD2tu0R9cULkdJQS3rg
 fJ7sjGTPldSUiyIhPiliEpZ83iFoRyNiAL3AXZxLRX/AqahpqDd9HYbQ9aTNfMos3N8K
 g6fuJF+kxPa4FbbUX8iVWVMhlIkk89tsHupR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WQKg3cIi4hIsPZ9PKTpFROffzkUZwNMkNLWOKFleW9g=;
 b=hLpKuZUaZP8asMF0YAYgFWNtdtQqfe95P3POwRqkiWa2qx+h9soikWE7kL4irc39iC
 Fm7HRUReyVeltaroDulI8H0e0iY/PTtSvydrU/U4pyrk6ckl3uI2Fi3lpP7VTePJ6Ka7
 dBoJcwp/BxtG7GURCyfUT7rLAwCJ1PzunQ6WvwxqU6slXEqBRuVI6i754j8UiOmVT3mF
 dnGrRYzjd6zBDZ392UGdQO3XKnaSqyj+PFFiu/tGbpYD1tC4Yxqf1WBTW5xMgflR5KMS
 0qeIkpqgLKFJkGhAR+YOSYSfT0bpHlnXtqhnE0AtkZAmOB2YM/qtobmiU9JSc5RYe0mm
 vJHQ==
X-Gm-Message-State: AOAM5300r/Co31FZLiv8UeDHx4JmdUZKBV3a9Gn0mNne9rfKapUKLw7O
 HJMV5cCJRVSubLsBnXzHXGf9xX5jmdRZls1TYK4=
X-Google-Smtp-Source: ABdhPJwI23GtC+rkaLZlWggpvfMhMnaZW+1xUUVYq8uFgZ6fR4Z0ABo3J/ivNeYAPB7FSf3BrykDpHzHhs00/+4VHLE=
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr14911021qkm.66.1607684990215; 
 Fri, 11 Dec 2020 03:09:50 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Dec 2020 11:09:39 +0000
Message-ID: <CACPK8XfkZq51yKJUjyqgKD=R-WZiCR0J18GJBbo=tfMKMMddSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.11, round two
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_060952_401604_E8E80298 
X-CRM114-Status: UNSURE (   8.50  )
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201211110939.Y2GW5E5EFWqFlhda8PEO2ihpoijt5pS8Ale-IwX592Q@z>

Hello Soc team,

Here are some late changes for the aspeed boards. Most are fixes, and
the addition of a new machine from Ampere.

(Arnd, I realised when sending the LPC clock fix that we had a few
others fixes, so he's a pull request instead)

The following changes since commit 5124cff93d99bbfe1efc8deb0c0b3604cb9a6659:

  ARM: dts: aspeed: g220a: Fix some gpio (2020-12-11 21:28:02 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-devicetree-2

for you to fetch changes up to 5124cff93d99bbfe1efc8deb0c0b3604cb9a6659:

  ARM: dts: aspeed: g220a: Fix some gpio (2020-12-11 21:28:02 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.11, round 2

 - New machine

   * Ampere's Mt Jade, an AST2500 BMC for Ampere's Altra reference
     platform

 - Fixes for eMMC, LPC clocking, and misc fixes for the g220a machine

----------------------------------------------------------------

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
