Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA74C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F394A23C41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F394A23C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K+zrBjtwcAxQNpnW/8R7Q5Mh7I+dszSRi0fa8vC7kHk=; b=J6RWhDnq+bD2mN7TlxlECjBN6
	d6f6+TTn+c1OaoSnBWC/YSMsVBW4MayUqKF1acn5mMAoGqfDjom1PfzHk95inhdGxcR77B+9GjNZi
	ZgLEyV9JIjyrb6wLaKc450VZF8MnjvkilFHQWsLY4JJikpKEAHXnGwhbdBxPbgVosxftE7G1SrC3Z
	dxUF59x0qXi7oKCHx06Onkok7Y3vtKJbdogwWZQZq6Ej293TGSPK6XISKh+hFQ13NWXIs0w6RR2K7
	E0GEyndcjYTJRZrl6VQF05KTHIvqpV30LudQpcX78kmywBb3LS2QlOQlon/oM8DBO0q6mRL0GlQxT
	NcailzBPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2XH-0001Eh-C1; Wed, 09 Dec 2020 16:41:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2XC-0001D3-Ja
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 16:41:47 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.11 (#1)
Date: Wed,  9 Dec 2020 17:41:35 +0100
Message-ID: <160753194681.3961338.9506933250014235951.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87k0u2j0n7.fsf@BL-laptop>
References: <87k0u2j0n7.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_114146_793281_BD2E130D 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209164135.DiI7C0yhag0qZzuJO1FApuDsmLraKeRyjKMv56KVAJM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 16:59:56 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for arm for mvebu for v5.11.
> 
> Gregory
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 4bdfafd6ff2938057df1fbc586db9a9c61541beb

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
