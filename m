Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B8C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7961F61053
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7961F61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZrYNc30nUi/eSHWLAvqmg15HUjF7CHlCGjNSuU6oa0=; b=28o8EAScwODxoA
	rZCKUA0fY/DeU/lANZL/SP7xHKswlbOjR69+D/d4RUyiFEuA7eb2+g1NYMojCuUq6Vxwm+9D3p1V0
	/+V25bkZ4MMftz2fQB/WrJf7aZijPEXgnF9nc27qj/br/CIPBqxSFAerTxJtXnrBp5b/nq2pEoUfz
	pnUDYmg/I+UPvJhh0GbotdR1192XUMGobSTd36iCFn30fOHHtQaKHxWbc+cXGDDR6Eg6Mo5xdQTvO
	rMbVqtXQI4rFAAkDHbjhtK37ICm5P0XMg0mn+RMaGpNIoHATqLfk7+vsHqX5phcdfLQ0JfyT4xWrP
	zS2pOU5g1ENSE0XMIhew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLAt-005bKV-Dv; Wed, 18 Aug 2021 13:00:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLAZ-005bGR-Hu
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 12:59:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D6076102A;
 Wed, 18 Aug 2021 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629291587;
 bh=05Gg6bUoBv7u6Hxcck+kAyNgU62OKbfxTt/EcoE4NBY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u6ygCv+t86REqk8g2eaV50fw/N6iKxSt60jJ1DyHzqBNmb+2R9mb8EPa6r029HDLj
 DPjGuRZIYZutmznsj0dnLwj6MpNLwbZ+aXc3q9SNBcPAF0QL5kBc8XZgnnOGq2SY7o
 R3ONSban5hgFX/eSAZWDLYyPv8+RYJT+JXq4eDfNynjrQ4WroHyO1YokZ6GDkGFzmK
 LtQfdTpehK9VPjfiIIcMJsb9ELL4AAos4tc+NEovx9YvivuT5ISVQbC4zI2M2vqh46
 g4Dfw49+Txi2cshNHej8dJWUL8zhdxj8G424iMcCbuBGpB1kIpWDFNY0ZN6KcP4kJe
 zCn0KOS/D9BXA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org, arm@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.15 (#1)
Date: Wed, 18 Aug 2021 14:59:24 +0200
Message-ID: <162929137212.372162.12996626191507618886.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <878s10ypxe.fsf@BL-laptop>
References: <878s10ypxe.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_055947_657648_B027AD9E 
X-CRM114-Status: UNSURE (   7.70  )
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
Message-ID: <20210818125924.-cQfsKKuZQSDis_Hy_4DbC9T6QOfpSCvsMLyTQ0YUsE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 18:52:13 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.15.
> 
> Gregory
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c4d3928250de919a1d324f6c8a7f26f51af40fd2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
