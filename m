Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60D2C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:53:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 934E660EB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 934E660EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vq/1XIrjLdIXzc8Sjrn5imkSCsmShvNIPEPoadNI6zo=; b=kxz+Abu1Tl3AQ0
	YUqZ4UKS4uTQHzhZv+H4CsOs8xqcw+0rwl9JOTNVycL0FjD7eyfLfaPiqhjWdq5VC4vYLZXzWbaLp
	adG5diwN69jOwGh/5OQwB7PcNq4/+1eRzDyEKcrH3qJ+023FMQwpvFGIWWzaSCqo5+jY8WV+nOnDy
	pORHvdZWXRoSBsH4dzsNmiP0WlHx3AUdX66XwwdP2sIOkbnlQdSiowf9RfXhpKQ4TxGQN3BY8NZUg
	45pKLmZaFRxT2onRHC/WkixjSr8uzkwdgWnioiu0aAi6NVvhq/v9DZuH10hOFwLcSwO+0VNTIwZor
	3LU/MMeICTj5WTV7n3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZweZ-009p7t-5R; Mon, 11 Oct 2021 14:51:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZweU-009p79-TT
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 14:51:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0905960EBD;
 Mon, 11 Oct 2021 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633963902;
 bh=qImxdEySkisRbl7VzAtNi2ey1A7keFMa0kHEUhQvIEo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mVCQy9oaCG9Nu5SCE72s1zcWAIBiwIBS2N+X0TvCCY/szdsS6NOfLv+CSXJxFZjai
 F7WOcsMGKNb6KjeSU1QguqFwJ1MZ0MDUHNrE+8UT/mNwx2nH2KanrMV9W8ocNatvjk
 4vNV5fYaEuoDWj5UkobWizfGcEVCOM0k0b13BowkVB+nwZbve/S5eQXoCMzDZV06TS
 iQkZ7Dh8cwqmLvtc0bZDeOX6KSV2Ec8svkmwztgEX1F6ZDkaS7XenkiGuF4atOt8zQ
 5RBH5BvhCiUo14V1YmxCM0UB9ahfiSxktpCqVgLPodo6I4QpGtYm2MC8oeCH1aEcd2
 GEt23Xsh8CSfQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 ALKML <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v5.15
Date: Mon, 11 Oct 2021 16:51:38 +0200
Message-ID: <163396388944.3084489.15615015867935355904.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211006153231.4061789-1-sudeep.holla@arm.com>
References: <20211006153231.4061789-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_075143_005725_F047F084 
X-CRM114-Status: UNSURE (   5.55  )
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
Message-ID: <20211011145138.SmBVG10n0BNZSgAtA0B0cAuJ0S_xmR0aB5foISxPtjw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 6 Oct 2021 16:32:31 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 209ee634bc0d2fa10ac8f799abf09207b5ce489a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
