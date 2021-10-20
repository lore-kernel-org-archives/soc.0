Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02251C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 21:25:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACCC961372; Wed, 20 Oct 2021 21:25:57 +0000 (UTC)
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
To: Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	arm-soc <arm@kernel.org>,
	Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] STM32 SoC changes for v5.16 #1
Date: Wed, 20 Oct 2021 23:25:51 +0200
Message-Id: <163476513253.4063285.3056228321667597294.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0b6c9657-dcca-3bad-601f-610dfc81d9ae@foss.st.com>
References: <0b6c9657-dcca-3bad-601f-610dfc81d9ae@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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
