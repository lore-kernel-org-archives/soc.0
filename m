Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2779FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D558164E04
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D558164E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6XlkgH+ixnr+EeXRtXMpLnhBoenv9XwK79Jao969ioc=; b=Owq4VnplTJUWOOU844o/U/X3D
	FImNGNTkXY0bV3NWczPUxwveUbp+QY6qPemBZLzDdUVAniNAdqyZlDvfjBGCzu5jOh3kXP93KJoxs
	UsCZ3Few1h2xjFPfsiSYEtxnioXiuW/tNXAWwoASYfrCdvdu8q86IioXfay553w4wMugLcbS7ow/w
	Q0HRENX9eZpfXllyaGVfQ51RVavAExXB3m01+2iMYHW4O4uEi7EN9fP0IzofEav/w9YOguI3vDzRU
	BGiHJEV6/oid1Bgfqk9Lc0MYx86qyUlttXA0i/WOVcrf2NNruO8nuX7kMZninL2WWw2S5fIZF3Tc4
	PW0FLi2OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oWY-0001UW-Kt; Sat, 30 Jan 2021 11:34:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oWJ-0001Oo-2A
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:34:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A52C64DDF;
 Sat, 30 Jan 2021 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006466;
 bh=RFBIYfH0yKEs+Ldd1LKFEhmD8Ytv9lJe9IyXY0RBW8s=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cvsxiMhv7GFYh93UueIhVmKesTcujca7W/Wt6wlOFZ5JG4K4mTr9hqFo0k+c2ZRKa
 AET0KKVxPetR5cPbu2Xa433hRsJKuRLSY7Zv4w2JmGWlBTZhpa06bI2lwsXb78URHC
 sfzp/ZWE3km6D3cWAx0cBEUqhRuvJAvLsMEcqLCPinc4xs/9Hrotb3ESQ185r8sesB
 zyZurPXiMWd7cDCY+wSVrqWrEYoxCT6m+yoPQSh073EbfSk13riJYuaub1vUbX7tX5
 ovzpWHk6VvYMFPrtGf1Mg3n1oSXgKI1G1SL5gbyIGSzWgRKWNLGzKEBz89ZC6zsa8l
 MxiDB/+BxN1ng==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, olof@lixom.net,
 soc@kernel.org
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.11 / 2nd
Date: Sat, 30 Jan 2021 12:34:11 +0100
Message-ID: <161200641621.2316427.10578020919040604420.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
References: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063427_218340_533806FB 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113411.4FamU3tfWbZCcyaPnw57P0swmv2g0wnwzvs9JeY-oLc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 09:33:57 +0900, Nobuhiro Iwamatsu wrote:
> This request includes the WDT / DT patch for the Visconti SoC.
> Please pull for v5.11 kernel cycle.
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: cfd7eed90315dccc79a4ad70724011cc76fdb994

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
