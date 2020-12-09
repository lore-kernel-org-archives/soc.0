Return-Path: <SRS0=MYre=FN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7452C4361B
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Dec 2020 16:42:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A2623C2E
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Dec 2020 16:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A2623C2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kmAOd4gC+B+NAjGUT36n17zmQGOBXbEH8gnYpoOikek=; b=v5ER6c2qyWLlEnF4mjYLqFyIj
	3sNdTLi5JY4G86WpCHTPNCNV9IZAQ4mMokMqQhNx+xra04pL4Rc4U9SXlFUoylR4N9bdz3GxNMQtm
	d9/aKA4bbL3IDdMNqZo8KOmpHvKOVMsPrDmtNh3WCE6yuuiPVpnsaiJF5sLKbRRfKcCdKj/1QSl7W
	C6/r9QuJjUw+Krd/EAKfRH4Nz5N+/X0ZliVjas9Hn7dBI7ywuGJoIqwjrZ3sMgMtc2reWjCJgJg8X
	YAn3mTXV7eHm9KUUlXJvD+lAZSqiYEfsWj9FgGSqQBlGi4oTYt6mUIO9d3ECkoRGT2/6EDpYP/ZQL
	TzOB8vmQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2XM-0001Hx-E1; Wed, 09 Dec 2020 16:41:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2XE-0001Dt-0y; Wed, 09 Dec 2020 16:41:49 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Subject: Re: [GIT PULL] arm64: Kconfig.platform: amlogic updates for v5.11
Date: Wed,  9 Dec 2020 17:41:36 +0100
Message-ID: <160753194711.3961338.8142968538464545195.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7hlfehjgv8.fsf@baylibre.com>
References: <7hlfehjgv8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_114148_198876_6C434F96 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209164136.qkT--OsHiG9Twq0LhQMICsmEoVC_mkwhcuGm5Bq82mk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 01 Dec 2020 14:34:03 -0800, Kevin Hilman wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc
> 
> [...]

Merged into arm/soc, thanks!

merge commit: b760bfbcbff356c7cfab167205ff4a4cf9d7a0b0

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
