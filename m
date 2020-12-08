Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FE3C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:37:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF18423B00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF18423B00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MWBaMDXenjHdzFf3tKbzgoalTTQWVI808XiRfD1aftc=; b=t5/ePvilNN7rwSlVy19/O+Opf
	gcKZAXWglekdY7Rv8RGO+nVVUsPPQilON0/AGx/qjo3ReFLICj9keAaXwCZVvbB+6fD7WSbtLyWaI
	p0IU7Mg4iDFAcVDY3yejVeUzRDhrFRVQ6YB61NfHGmxK+rQ9Pz1fZCQeC/eQWQdv5H1yBYTVFXBFI
	kknRJwrMBsaTTF05wRlSufyDNMjefZu0WSZlOOqQd8Px6eXAt453MUu1a0Wl5/QKftGwTMrVO/R1j
	L1XUwFsHcELSGhJsbLDcb3SO1R9yRXpCa5z7P7wnXSrsRXEREnHtFeX07ittv4lTJ6+39tEsPVsfH
	rjI3ARu1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfyV-0001hX-CX; Tue, 08 Dec 2020 16:36:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfxU-0001No-OG
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:35:26 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, arm@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org
Subject: Re: [GIT PULL 1/4] ARM: defconfig: samsung for v5.11
Date: Tue,  8 Dec 2020 17:34:51 +0100
Message-ID: <160744514152.359082.5695891765941238936.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_113524_927292_24CA82AC 
X-CRM114-Status: UNSURE (   9.48  )
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
Message-ID: <20201208163451.KgC5NFdURmrWqfhAZgl56zh8-bxD_u0Vdk3evNbNJYA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:44:01 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.11
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 1fe9c2531974cf7d5d8097773c53c4bd28703aed

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
