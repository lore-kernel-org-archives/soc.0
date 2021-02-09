Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D5C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:14:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3083464E6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3083464E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DHVCnxDZjDlCNfePzlB6Qnv1CtzTx6/QNfBnItwbcyo=; b=3I7oEFFYVxbPyCRkxHQci0nBt
	//D2s0Hp/4+9hZGj/xBpxsWgxAdjhFkcD5L+dqNF0FpnMqdsipIQblyL5KXHlXk7t2DDLfL4HkC7Z
	yVHqq7JpUFTOnGVmDPtXkqhUzQ7/NXQGyMEox4rq5ETvLQpaxxOg7SLFP/3CwaDycyoxfTv7A63cS
	JITj/wCYdTCivpEavShICzbUsfC+QiHXASXKMXYAPBwQka7B80MfrMdRMRP2tgmJ5dgRjI0cmorkq
	7FBz4VaOWYkqFHPK4w6a0ZyYeWyz4rC+MyVvaRo51iu69KtkOju+V3La7e3MMpIx56j7KVmNKX+DK
	kLaaaAh+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9cCD-0001dT-Gg; Tue, 09 Feb 2021 23:13:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9cCB-0001co-Gm
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:13:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3757E64E66;
 Tue,  9 Feb 2021 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912402;
 bh=+FwThmQbIydIO66KLIJ43qFFT7FaCPoF54VIyr5Pt4M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JiiuKhosKmZYc/vA2i+hRXtub8k9uxttUFtZTQSlG02znw8YK6yyczEiTCmYKt/FB
 7ptUQdz2QBkVZQwvdvdCuU+Ztt06eqsBXT3OOyVvtsan+Q1xheXjU28o6YS0VMkFV7
 OMTA5uvl4BjtziQCr7Qa9H8hvO662AOgDoedq9c3KvRABh28Jloe9F0BmxO55nul5Q
 crQ+sAHq8Q2sIpHN6etXqD/M1/p8O4BTxjf4zzBeh2cfB13aF3FBuHqViCg/9ejikZ
 V/yernwDlAk0GM9JL2AkVNUUNiZee5Ei9LhioyhMq7Hdtkm0c8zyfvMvXT4KSLzlxc
 N1ANjJylYzRAg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Subject: Re: arm64: soc: ZynqMP changes for v5.12
Date: Wed, 10 Feb 2021 00:13:17 +0100
Message-ID: <161291238389.977540.16961858748175182289.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <2b0f6314-13ba-375a-9231-925b0a07be82@monstr.eu>
References: <2b0f6314-13ba-375a-9231-925b0a07be82@monstr.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_181323_673124_F7F54E2A 
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
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209231317.SRpDMst-CnE59HSVplrBZFzvAmNwZvsiR1QHyfqUdcA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 14:38:20 +0100, Michal Simek wrote:
> please pull this simple defconfig change to your repo. Maybe it
> shouldn't be labeled as soc change that's why please let me know if you
> need me to change it.
> 
> Thanks,
> Michal
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 21e4675d9305f6ccd20b95d943882d607c8ae288

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
