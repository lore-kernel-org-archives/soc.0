Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75052C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:49:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A75964F7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A75964F7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ieImqjjEo8L8l6Mra3xg1gaZH7Pry2FWZ0ANUz49a6s=; b=nb1OGcen/tIz1QiDeh7yA/yBc
	V1Iw5hc/bh0gFuU/7CefctNZng+QMjRM4fiRPM4ex7TkmwWOvxu6gBMWrEeoM3uHtqFfbBz/WJRvH
	EeHHbZczOjsm+FJoqzgHM9R7mtnUVet/kOqWb/gJrMx9p0iQB5KdVwkUJZUZqx8qER9534Z9sxrpR
	uK9vO724SXIWa+4sVtqNQvx9lbhzaeeoo3i73H1FKYdjJ0QIN67csSS3eOBJnMLe5rYpokErPnz1n
	94QmUlSnQDf1ncOX3uy8Y3YFHRc0gguqu2YiWJwyaJEJuI2GiE0Coz2svFxLHVV1mLl/f+CnR/ocB
	KajDXmgFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6yqT-0008MO-1h; Tue, 02 Feb 2021 16:48:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6yqP-0008LM-8L
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 16:48:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A0AB64F7F;
 Tue,  2 Feb 2021 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612284480;
 bh=R2JKYXC6NAoRuSanZPQd/DMB+L1eNAcjJrgEMgYwM0w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcqTC7dADIoHogusTvXfCbjywtV0jiKHfqHhsLn19jWf2CU6ekfHN7GlJhVlVI7l8
 /GLLHdNphhynu1rV7DX5D4kyMNjyA5RPSBIh8YNkF2p3TdZCwOa8ZyzJlS27a5iRQA
 BANfKNlQ78sOJKrPpy3TfR2KWbB0PVrOTMLL1oUpk2n7HvWgQgTytVmln/g+Fcw0K+
 IDjem5TiURKjF98KL5MpHcnYXOWTo3wyba0jm+OC/WDPLERZhNq8N87ZV7erA/nMsB
 GcbG1i65f5z+urPVoEgBhBBda1/18sdaZEDJMR1wle+KPxe7LPsFhyGA1P+bbwmooC
 uXrXXRTegbdHw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>, arm@kernel.org, soc@kernel.org,
 Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/2] MAINTAINERS: Update to TI maintainer for v5.12
Date: Tue,  2 Feb 2021 17:47:51 +0100
Message-ID: <161228438414.1848830.8600684869682893491.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130131411.afna4wj72r7xscqn@skinny>
References: <20210130131411.afna4wj72r7xscqn@skinny>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_114801_485909_7BEE9D21 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202164751.tEW4Cxzs4RxzX9caJOMZw8JwvNBHXjQejoGZtiUrCd0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 30 Jan 2021 07:14:11 -0600, Nishanth Menon wrote:
> Please pull the following MAINTAINERS file update for v5.12 cycle. Made
> sense to send via ARM path since the main PR path was for TI platforms.

This seems more appropriate to have in v5.11, I tend to fast-track
maintainer address changes as bug-fixes so future emails reach the
correct address.

> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 6102f9e700bb3fee2f37756514885e7b14a70ef6

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
