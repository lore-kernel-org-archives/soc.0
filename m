Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E254C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:25:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6A0610E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6A0610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QuC16WbEq0Y+99gpsH41ewTS+hxO+hIMvI2JWkq5yY8=; b=E4yodsbRinmlq2rE/NQsD50Oi
	BZVSF0fWr3ma6AzW3Y/HdNoI0i4q+2SQXfD8toFp4YpgdD4J9m1xRrS8ji373c9P4OCAxpe2RO6Tr
	+c4hRNCXYP4aEIkgeNz8ShiBkrEIYMsEYyL2msdAHo9lJuMXkOVZJMwWycszrQ3/nUYqVG/f/cwqI
	kZUP6GqacSTekROkTtHp2wpUC6HWE/yeHiDuxqJeq6o5Q8L99KEB61igAEpPX2b/pkzwLlQKqVdTn
	vkEbJfxHnsbRysudLtFlKiwLnzQnys6eM+MBEdUZ3gqYunOkhzJ1vrDEXTFxY+NX5AcTN1yrtn5PC
	BYQGcntuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3q5-00AvMW-4Y; Thu, 01 Apr 2021 20:22:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jc-00At8S-9W
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9107A610E9;
 Thu,  1 Apr 2021 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308166;
 bh=a8wXmiIZJuzMRoiHoMZd0u967sFUL0d5AugV/GBVCmQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NkC7djKdqiHs9fxzRfCOjkqWtzZY3b7dRjPmy8bwFfU4E1SW+QTfoayL2eeO181q5
 qpMZbvkVnBirYYvD1aDCTAyDB4Y2iQgUq3wFRqT2Tqt9p4mCJ9RwYmjrY2/J8tXlkE
 MS+J3V9xGrek97GOFzkNQD7lCgjtmDDrEuZ4S0F8U+y9SSX6UrlZ7wHONEQBbffKqv
 ceisQnrskf7v+6vIfdsfus7lMTZLxk4KOyTe+gJOZ1rYTxCFzBSzNdZ2A0akBTfFlM
 CSVWuWiBtWeGIEsIbFgs9N8Z1cDW9adLDOEqqNWtX/eULdBhBqVMLTwujfdM989vep
 fRNMjZBh+iuUw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: Re: [GIT PULL 2/3] Devicetree changes for omaps for genpd support
Date: Thu,  1 Apr 2021 22:15:30 +0200
Message-ID: <161730808591.655497.12428729315912496095.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617004205-537424@atomide.com-2>
References: <pull-1617004205-537424@atomide.com>
 <pull-1617004205-537424@atomide.com-2>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211610_318259_4263B674 
X-CRM114-Status: UNSURE (   7.03  )
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
Message-ID: <20210401201530.ssOqdStvpuSqjvlKgLj_eBpPcMUULV32UjDgyeDYMjM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 29 Mar 2021 10:55:21 +0300, Tony Lindgren wrote:
> The following changes since commit e259c2926c016dd815e5547412356d378fc1f589:
> 
>   PCI: pci-dra7xx: Prepare for deferred probe with module_platform_driver (2021-03-10 14:01:00 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/dts-genpd-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e49936d2154724213b5ec8a8aae89b2c2ebc3af1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
