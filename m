Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC214C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7900D64E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7900D64E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xrUAGpZZjz83i3NMVPuIHPVynedfxu8MOmDQ7mMP/uc=; b=frpU9xMORuCJ4oG60GBGUUaYk
	4oQsYucyfWicsKLcJDwGzzUfd69CMN0YJ87EJ3CVKYQSNIcYxEUvZvAp+YeU2mmKUunQE05VcHD3r
	RjhyrT7RN5wUYt9lBJIkRlr1LNJ0seHISrADA1T6JRYzmMRJZ7Ya2oM5g2WwC1ANBZL5Lj5/C7NRw
	sj/0nrNuXhq0qL8J0XW9j2Og94nr4VsJoy/fs1zABrrQTW9t/QTUym7Ydn7wWxcBZDT/8LwVmWfaw
	AKXWx7V2AUqCq6SjjzmZkxmSb/tUZy8orzkvgFiCcT1htJnwGi26fv350pXO1ca57tuRu5eXr7cZ+
	qkcqd/EDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c6b-0007XG-N9; Tue, 09 Feb 2021 23:07:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5e-0007GJ-45
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:06:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB7A664E5A;
 Tue,  9 Feb 2021 23:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612911997;
 bh=BuVGOgcKBY6v/5FQJuBvz93sC+cXkuKqd0cBByl/3tk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bOnZiT0zQdcbqnndwCxAai1B1pIfzx+4ZxoW7PrIh8A0z662KyrInNnfLxTc6ed8W
 CEgPqF94U9edY4E8/vVx9Ywh2RgmREOFIVrmE9YHTcFibc6xeeT15gyacgauVl7dwQ
 ueD42Vkr78SbAckkajqqMPDjsS0lUa9mJNL4GaxS0TbB7yM5vFWxrwMKDmwNCDk5KO
 uICn8wh9b7o+brGVSGiJNhkdDB1pVZO/Je16Zy+ksceBCmazY6sUfvyo9ivhjY9Vg6
 CU8bsLIiy8byGl3sDx31lUwOV5LpSswH7/bhA3dpGL9TMaqRefKrOYpmQhUMDJaOex
 87hcmpgcEx4ug==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, arm@kernel.org,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Date: Wed, 10 Feb 2021 00:06:09 +0100
Message-ID: <161291141019.975053.14323750026373147341.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125191240.11278-3-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180638_299510_0961A651 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230609.v_MaOK5Fa9IKlbKcOeZEgsKdlwV6C_Jf8JitITwiZwE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 20:12:39 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.12
> 
> [...]

Merged into arm/dt at least, sorry for the long delay.

merge commit: f3d8876acac00e7430e46679fb1da26e50c006d5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
