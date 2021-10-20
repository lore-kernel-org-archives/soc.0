Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6508CC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:27:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234AC60E97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 234AC60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb+woLLcEUg7Io2EJqx5JoEHaFv8MZX6cqdluONC4c8=; b=FW1meqAX8tRblA
	ihrGqNGocjZgTWVs4lHMm+Zstk1qmu/1HuADrSJq85LUoNj5C/ddUVwytvl8x/hruxXMkJUOtbqjX
	Ix09161cwyWEcMCuw2mGIA1pvxNpL7otCn2LsG9DY5oHd4RSgZndQW6E7ON39FruJVqzFn07RupPT
	acKO+3inW5e5koFm3uyuL8/jvnVxn9kVj/sQm43nehJjN2thqIqjjHqb2Z6EOyx0GvS+I65tKQ6/B
	xRhKYkU2Guv8EY54RPS9o98giLFeR0ShGJJ/9MQfB2TfuJ0LeJnjgPWomFnLib8M8l8iIv66gtWrJ
	2N4IDuaWUwj4cvVrkQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJ61-005qbM-SJ; Wed, 20 Oct 2021 21:26:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJ5x-005qaa-U4
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:25:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07DBD610E7;
 Wed, 20 Oct 2021 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634765157;
 bh=FyjIvgN19cerzRzei6cHIuWikxQhKlEwCYI5A06JPs8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VYg3IsPtDeulwKvrJYgVOANpN52FVCp6PpgkjPNr8yz/wdzla0xnrIhMMyOeYFEbh
 zf9VBaL/hTuwTO17DbojNmyPIh2NZb9BGxlpEiH7CNWgi0kVhvxMHb3llrMcTT1Ob2
 IWqnyU6kmejiin+OgJd3OwOh8h+425E9at6xmKM/YDOjeH75yMQonKV8dfTu0s2W53
 ipU0TPmVm/chw5V/guCHxvsgnNQ7jf3V6h+XHwmOknQH6YGSpnu0inYLa6R+Lch9X9
 NVXoEMp00s4tO4wZ/Vjfv0Uoy/zcuY7S5YTTM1nLGgz8+sHLiJlMpQOSmlTpFAJAti
 RWd4qhXZzGvKw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 arm-soc <arm@kernel.org>, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] STM32 SoC changes for v5.16 #1
Date: Wed, 20 Oct 2021 23:25:51 +0200
Message-ID: <163476513253.4063285.3056228321667597294.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0b6c9657-dcca-3bad-601f-610dfc81d9ae@foss.st.com>
References: <0b6c9657-dcca-3bad-601f-610dfc81d9ae@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_142558_007527_1811B1A1 
X-CRM114-Status: UNSURE (   7.19  )
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
Message-ID: <20211020212551.gVxxFwVeXAXmMwOalTFA_AUB1lnPdAQcTfer4-544xo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Oct 2021 17:16:03 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 SoC updates for v5.16. As
> you'll see it adds a new STM32 MPU SoC.
> 
> regards
> Alex
> 
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 851feb4943ea2a4d2eaf7cc45f0d5b8b73f1b36f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
