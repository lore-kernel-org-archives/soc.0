Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B65C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:27:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EBAE610FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EBAE610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GEGMZDtZ/QmjVqiPpxk1/TOP9R3ZD8I3sJuV3DcpZlA=; b=nwqwCaMKmdm6OmRKFSC1svaoU
	TY9YVEz3CRynyPp/xCI43++MQ8xRyvzDa6UdfAdTeBKucaKrY7Hyh85YZXRajB9xmBCIMshvlX67J
	qSuneh0IYwQ7UoMLApsua2DsF/qWttIHQhAL45G6LAgL+++aL7y4h9s510O0SVbogHV5UKYqXeOmP
	veoAha+WvQUDY5MSFY1FRqx5qCLNhEJF5K42v5BH9mci1trXvlTssqKfjyXfETAKjgGJoEnFIiKjs
	QU1vm6pqryToaV6HqmT91xxBcT7VFQmK9F5rZ3ZPkap7c38Qq3iQOcyY/JWalxq56VCZgIcjn7B/w
	G5f/ZRg7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWWp-008NSB-Uy; Thu, 08 Apr 2021 15:25:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWWW-008NNy-JG
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:24:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC0D56113D;
 Thu,  8 Apr 2021 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617895487;
 bh=NY5Ca+YJQoktWAT4RxxV94o+oaHNVFhSxr+q2zCpoUM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IEyFyWwur6bLcsb1LmvcqnLV2uk0Atz0M0nXMPo5y7ytJP7OJbJj1nBV/WiqtX1wb
 sb1s8t0rdJZA3g+wDA7xXskwE5KxET9iO1RzqY5Blha4v10dp+L1aWz6kHoRncG8Vy
 XKkkXeXNU8BgGnRlUksyDxkSXV0tJRHeonbhWfqkVe12oLrd0cwb25CVJ9GvOtdzVE
 pQtyOazaRSy9agxtJ056v/6+Dv/sz26GmfHz5CETomwKZai0ByvwxK4BvIgruS0Q80
 7bAkp4nQ8E64GBCoaS10LZ5a27jndf7S7+oXJd6Em5QsjO/SXMX00lvHazXpcCYohp
 Y1VqOfeOSnq1w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.13 (#1)
Date: Thu,  8 Apr 2021 17:24:21 +0200
Message-ID: <161789462026.1629934.18198415044078612678.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <874kgocs7t.fsf@BL-laptop>
References: <874kgocs7t.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162449_057628_E48F03B4 
X-CRM114-Status: UNSURE (   7.20  )
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
Message-ID: <20210408152421.ZcmickLAfN5myfaD1uyQEN0MKliCcJf7PfYElCe0HSs@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 02 Apr 2021 23:05:42 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.13.
> 
> Gregory
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d1e3a9efb2afabad584f385b3bd58ec27ebf490a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
