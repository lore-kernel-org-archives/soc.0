Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF99C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA0764F7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA0764F7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IAji8TNqDaHt0ngiuQC+5vx17Z9C5l3X5/K2bqnVZ2w=; b=LczCXRm15zp/HJ7PWm9YrAktt
	hwP5FW9YAsu7pFs28zkD7eNm2ctu8hxRxEBvkp2kLcRJ8UD2fr6+clV71BUnLHEGPV9owCk1AO/k7
	80zE+WoOrX7ok3xB+8QHbP4v0KsGqHE4/zb9l9TUZhnFEfuq8uSX9X6yBuRQkiTF/fmL+5i+mIyoj
	/sesQUPJJEHfm8Jy7uaQ5meh3UHTc7H99fXwGi6lPGpYpvdoL/R1zMVhd8OCAXHy5UrCUxNsd0XG6
	Sp/aNvpfOUrjMrX0Uu3xGtUsWvxYsWxkEAe7wcePYSZwW6jNOqFK8ENL42GJD2tntpaUHko6k/V6v
	idbq9gdog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6yqP-0008LQ-OC; Tue, 02 Feb 2021 16:48:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6yqN-0008Kq-8q
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 16:48:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A4AD64F7B;
 Tue,  2 Feb 2021 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612284478;
 bh=B/qWAWOL4ROfuweEOczWCM/+e9Zh0rKL1qeiZEZDdDA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bScgUhlXY0TV5YaIXj0BrLr9WhZsJY2mD4vqeblUUdj/kMAP93783109qT6llqt+h
 k157UcYmQdh5o2CIt6Xa6MubJ5gwUpT8mXEpAHeMKGr5jsLps6cb0LLhYebbo2X/O0
 k7NbIvqK3n5EtZ3gDwNw3tm5OOm+fiwAzvZ6SpurMCd0PDIqPtOGGMecZRhSFksofA
 1J7TcYD4o/GxaDNbwSCiWprXtwvRIu9jzYXpGyn/I60xU8Qma/l+17iLUUf5wNlGXW
 vKZAaZklt9OQ9AuqKlpzFJ0MjvVgHQ2hiGUEEJlumixFJz5TLWr+QxBg/jn14dM38Q
 zKVVPNOFN8cRw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Subject: Re: [GIT PULL] Allwinner Fixes for 5.11
Date: Tue,  2 Feb 2021 17:47:50 +0100
Message-ID: <161228438423.1848830.360600745300776744.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <50368e09-c84f-4015-a6f8-70e75e12720d.lettre@localhost>
References: <50368e09-c84f-4015-a6f8-70e75e12720d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_114759_400041_70D4B381 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202164750._o4ytZ4DGQHWWK92O9TorylWgeVrwUci7RqjOCOaX0A@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 18:49:56 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: fe43a00f88c98de1cf1dea644a37b88a2df2243a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
