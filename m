Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018F8C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:33:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C9E23AA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C9E23AA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gicd9iErAPNT9eVtOGmWkFI/LOD4KAZNsLQE9jx7r+g=; b=UVAIECwAYKtjf9faGGhS06z2K
	FPWKdM/SLtdVs6iSzxVD1NCUIJJk63sxNx61ynRbUi5cbwIBWgicgkGTYgV8rYZhQXE8qgpWUZKPG
	1uvzMJOdjuA8ma9lZE1Di/CfiN/dsVa5KZ9xaRM86aUNRaN7j1GYkVf7fTftV6l3Qj9m8JfOPqqrI
	Yts2kjT7K9G5SKqUuhANOuVoOdqRFJNE2OvBMuiUUyGem4EBymTfkvr/b4S7PKHptGLHnxspdHVKN
	TfH5boJUVhqdr6DrW0wxVQRDj7iF7Fn4yaiDDCNiaOLO6u2X53OXohxvtG8n4LdEf/sN/5CXThA5m
	EEURq1sYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmTK-0002rA-9d; Tue, 08 Dec 2020 23:32:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmTB-0002o5-Ds
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:32:35 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller changes for v5.11
Date: Wed,  9 Dec 2020 00:31:41 +0100
Message-ID: <160747024216.3766805.9460404683899134020.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
References: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_183233_620287_F3938A41 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208233141.4WYHVkPkPH1wHaYBHpT9I1_yl3q70jLciIFyJfw3UQQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 04 Dec 2020 15:25:02 +0100, Philipp Zabel wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux tags/reset-for-v5.11
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 03c48a830e9d256be34f15f782f9877d0d9a9c2f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
