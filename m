Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6754C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E6DD23AA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E6DD23AA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NbAWBfs88NwxHI0I53m3Fo1mHtYCS63hIiNjwD5EQ18=; b=X5iCq7846kVThxx/x/6R8rjlk
	MmdzmcaAUt6hutVKNSFyl5XR5LYlP71b0XF8EDrJFcSckZ9cGCLaUWtrh4GfhCtxaz8Qm9yuqngHD
	phc1Hsk0yU26vOOYy9OFzCfEzUlaXn8WTeamh36yKmgViE4YiMp1upSO01hPJm/P4JfGklrnHVvnH
	8CpT44TmaezvSSqKeOsBXYAJnIwKODEx6mR4sww7M8gPBtAWQlONVPdzi6F3AqAAXgvYNY9q8bmY2
	B3togb+FrFUodQ2eOyxuUGOo0ljLhJXByZusiZchWg0ebecDdc8xVwAUAVLpLoBif2fIuY1UxjznH
	whTXE/5Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l359d-0001lz-Cp; Fri, 22 Jan 2021 22:43:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l359X-0001kF-Qr
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:43:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13FC123AA1;
 Fri, 22 Jan 2021 22:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611355417;
 bh=aKy7LaMFG+ANnZN2hwJUm432fjidcvV4+l9/BWaHuqU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oY3cRHhe87GtB5KCDc6FdWuXnwCh+mwcSe0/XQlLNIlgbOks0fGnJBjWo2BMLYcjF
 MlMy5FKvDTgW9Yz/s+xGFb3ayXKuT2S+oeB7uDdWXXpYt5k6iH5IqmAfB+V2ZSBw+S
 7M+hXzveZ+2etO4VgmX9PRfCYPQW8sEfU8hHRsDBxn27M3SuZ+Lx3Gf4xzz00xeMkc
 zJFlYdSDNhoytSeMMtsdQ/k5uBGnW8gWaJuP8xC0/i8q0YR0TTpLyssgHhkRi6mKN4
 d1W1hu5y8wD+lXmvurQXdKqFADNaICzArpIF2INdgh00aL1sHWcijtztbMZD7EkAgm
 142JXRWtiujZA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2] ARM: mstar: Unify common parts of BreadBee boards into
 a dtsi
Date: Fri, 22 Jan 2021 23:43:28 +0100
Message-ID: <161135518046.1310202.10096061681770610448.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224020354.2212037-1-daniel@0x0f.com>
References: <20201224020354.2212037-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_174339_998631_377C5A7C 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: olof@lixom.net, linux-arm-kernel@lists.infradead.org, w@1wt.eu,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122224328.X0TFg6OPQmvIObwu-oaUBWIElPTbdjoyJGOuaThh-ic@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 24 Dec 2020 11:03:54 +0900, Daniel Palmer wrote:
> The BreadBee and the BreadBee Crust are the same PCB with a different
> SoC mounted. There are two top level dts to handle this.
> 
> To avoid deduplicating the parts that are more related to the PCB than
> the SoC (i.e. the voltage regs and LEDs) add a common dtsi that can
> be included in both top level dts.

This was missing in my earlier merges, sorry about that.

Now applied to arm/dt for v5.12, thanks!

[1/1] ARM: mstar: Unify common parts of BreadBee boards into a dtsi
      commit: 8367611892442ea788139ea1063308b6e7b6f04f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
