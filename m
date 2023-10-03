Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B3E75455
	for <soc@archiver.kernel.org>; Tue,  3 Oct 2023 12:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5360C433C9; Tue,  3 Oct 2023 12:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FD9C433C7;
	Tue,  3 Oct 2023 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696337108;
	bh=RJXkdGT/Nhkeb2GuoSRT2fL7sCAwLnQPGvr69EUBjvI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=pargP6MBcbO0eqbPYlG8SeUTvjfHoYjB1luHQfdbgcsf8F6ZbM8E4RQBJr98P7G+G
	 UQ+mBqa252CJuexEOSRcyLexoRoN21yqSDH5IY2UsrAdvyhuRaxLXWj2DKKcVasL4K
	 NaPu5ULcg/sSpMng2GlFSyQBnNuDnC5bRUzzQTigJ6OB6jzrKS58DWez8fMryIBxpw
	 5c61WelMqR7e/Kq3TRc9rDkh1gg0wdaDa0IrdMZO/9IcdPHCcx1gv91H97ggSV++u8
	 bTMMMpobvBosOOIkFuOHxB3fl2VFzKK9v00YhbNjQwgVn6SNlsBi8W5DUv4w1oICaM
	 jCLh7o2qwGMEw==
Date: Tue, 3 Oct 2023 08:45:07 -0400
From: Sasha Levin <sashal@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabien Parent <fparent@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jieyy Yang <jieyy.yang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	stable@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
Message-ID: <ZRwM06dwpF/7wEs5@sashalap>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>

On Tue, Oct 03, 2023 at 01:13:42PM +0200, AngeloGioacchino Del Regno wrote:
>Hello SoC maintainers,
>
>As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
>file, adding myself to the MediaTek SoC maintainers, and some urgent
>bugfixes for MediaTek devicetrees.

Just curious: if it's urgent, and there are patches cc'ed to stable, why
wait for 6.7 rather than one of the 6.6 -rc cycles?

-- 
Thanks,
Sasha
