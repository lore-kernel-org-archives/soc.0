Return-Path: <SRS0=UjyX=ND=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20EFC432BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 21:11:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660B161038
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 21:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 660B161038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1TJ7JfAq0FyVnpF227Z8u7cnt9vTE7apQARrORuMMk=; b=lOIUWQ5C7HLMoK
	IPxhOYj37MzRvK4ii/zp8UZv/PuMb6vPxbuO7UPwmtcqFW5+bSa7Ens5WLzD6sD72G2cqPskjY8tf
	TB7/+sQ4dvLyvMkLv7/L+Ns1iEm0Hqpn/j2hTOIdHC6bud5SYWartINcEW8Ix0aLuZ12/fKjeAKhk
	67GPe/xnf6hRr9GmJ+2lcv/zpLS9vTtsezEnmjL89k+PhuyM5OKIcQkkCF1wizU91Bl+bhYuzWCdr
	dShMuvJ0ZC3HvS+wdGWek2fnWPTjC/GfpGY2mMj2lH/2PhbSKWXjLTs4Yb91zySwqyR2ntobTHJIh
	sxv2pHDRnWQOlPnxeNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHyx-00BLoA-HQ; Thu, 12 Aug 2021 21:11:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHwT-00BKaL-Ab; Thu, 12 Aug 2021 21:08:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B02366101E;
 Thu, 12 Aug 2021 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802525;
 bh=SQRFibz0JZpGLswRiDOBmj10evnsaGsg60PEB+9n/Hw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kv4dnsbB+LOLD/XYjvkumMxR22ND+0OhW3Oypf1IUANpYIX+OU7FkMxDqpCcT0nvy
 tI1/hF62CIeis34Q7dfTlcc72opb2G8hiRu3DYseBPSM2squWM5i1fKhSdS45Hgp/3
 tnBUXZVBWXL+vXxoNW2tg4H+v64YL8vucIQhBxh4kZWwnOf5ulYzOJDZK5GKIj4Apd
 1ylqi8Q3TCj6RKxksaHceN8PC6g5y/Ts6zIehs8Mnw3NEI/qQIcTkBEi69sZFtpKtf
 sRoGrqJOXYwl+0qJzRuLiFAX8EM3GGPObhzpsTAfgZ3Ink29D5XURcBNRuQhhh1d83
 WjG8TA/CD2qpQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: multi_v7_defconfig: amlogic updates for v5.15
Date: Thu, 12 Aug 2021 23:08:39 +0200
Message-ID: <162880251654.1376866.17026578806860861616.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <8e2b5139-86e6-0da3-75c4-d8df66448d51@baylibre.com>
References: <8e2b5139-86e6-0da3-75c4-d8df66448d51@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140845_454283_9C236446 
X-CRM114-Status: UNSURE (   6.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210812210839.AJuPkHixEZaW_OoQHnIPEG2FEBAQU3_4icDrhiJwpkw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 09:46:59 +0200, Neil Armstrong wrote:
> Here's a single multi_v7_defconfig change for v5.15 to enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b
> 
> Neil
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 20904527a70de3aff43edafdf5d18b0f6f976f59

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
