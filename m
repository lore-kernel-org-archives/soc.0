Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC703139D
	for <soc@lists.linux.dev>; Sun, 22 Sep 2024 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727009671; cv=none; b=OnxV5VrIxtPdnNG4Wl8qWNTTFzN0wiwcPPLmRzNq0dndLAgEVYTLZ2HjaTLL4h3qc8/zOUugEEtjvPtKJWk5LgtfCGLe79nq5QbPL7wa5zoWTYbXLoP97nEaehKbViFwzW+pKe7CMlCzJ2Y+eYFBq1g/Gs7XIuI1YuvVGhtDNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727009671; c=relaxed/simple;
	bh=9hTuPr+B3KHIKAelhdUk9LKb6pM45k0P8KmcpTyBYr0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EmwktS5nDtKRfUNi7QwZf/2U+lFJ/AvH0ZV02IJjnE1k17kNODVEC+xNsy3HnCy0IyAnLVYfeHhqgYYD/XG0Zm1qEHgNExtEruacgnb6h4y5KE0WhouXSIfwvjGSZJn/pKTQZg4dcqy6Ok7Zvubg2XLEiK2CZ1F/1y+fhUafhLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIi31+C/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIi31+C/"
Received: by smtp.kernel.org (Postfix)
	id 21002C4CEC6; Sun, 22 Sep 2024 12:54:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 200C3C4CEC3
	for <soc@kernel.org>; Sun, 22 Sep 2024 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 200C3C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso44146425e9.1
        for <soc@kernel.org>; Sun, 22 Sep 2024 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727009667; x=1727614467; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9+EtBR3azzcqkeGxUhNS4gUNER4YDA+9BTF7UuDVDg=;
        b=FIi31+C/DQ8Z8YzKmb+GLoG0XgIRxndC8yy1h5beHB/RsPZGxTBg6DBFRl2jEmko7j
         XyMDDHaecp1VeaimI/vjWOlhK5d4VJj1qxuwtAfEznumcsU+6h/hsA0AZYERZYy4UmZN
         y434xQlEEvqY5tEIXdMod90AoJ4dvacFQKiJb4MZXnzQ5OmcvRQ7HzZgpGau0ZPpZXku
         5KDV/WCv2K/b0/JJvMCPns1TnOEkVwJZBKw3x1SOk6ER6k4OTVVDRGaACSUwrVB7vw85
         /JSSdq+xCQ5X8AIMY61yBT1DHPj9IQuOnoz8VnyANEysPRo4N/+T8wzwdUx6tyZiW9zr
         y39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727009667; x=1727614467;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9+EtBR3azzcqkeGxUhNS4gUNER4YDA+9BTF7UuDVDg=;
        b=HGgXFD+SZ3uw4KSioKKhNN/GB/lVJ1VoGonP/waS0cpF+hhMQz6oE/x87L7Jy7Tx8K
         eZBXPOFbfhxGea/tzcw0WkK18F90KJj6PdzZr8TN/LnpflrL2EnHRf/nVhl+UNqkr/nt
         vu8w/X5bv2UnvuGXPwhnk7MlbDmjyHbietSTQt8GFTxPVDstOI5uOXfgZDK5aXM/Jzlm
         6X3TM0v0J2rxVmlefNhK9rPVcrRUQruD4ANhX3RF/eQUWKrHGPh6FDqaYNFimJuJLWDN
         tp9/fIWsXBxdaHDkFSCU8xrtKJtOSTphmbwBEdZWjCt6s/h+3tMAmG8ZsDEZe8IkpL96
         N1Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWvQO6eKqu9dCDKmYz8htR9rSYljRXHIP84yy+a0t2JLT/8H6XU2ZAf4jplZYSFaS+Ma5A=@kernel.org
X-Gm-Message-State: AOJu0YzehBjvXEGA7WRQGnmOeiR3iBs9ygPaRB7JdAuDGqWj6pEAcw2l
	n8Wh5q0sPLyt2RWteFwl48rOgO+R9bZm5XzTJiaFXmaV7rhH7Fgg
X-Google-Smtp-Source: AGHT+IF4D1kWTYZjKNx8py68FOu1UyJ8Wf/u8gPHCfJTfC6kxaEL9TAyMJ5BZUL3jusB7/scEDTIFg==
X-Received: by 2002:a05:600c:350a:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-42e7add6bb0mr87514665e9.29.1727009667039;
        Sun, 22 Sep 2024 05:54:27 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c5404sm100031895e9.39.2024.09.22.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 05:54:26 -0700 (PDT)
Message-ID: <194f2e20d40a496f9e9f23392ee911900a7c30b7.camel@gmail.com>
Subject: Re: [PATCH] net: cirrus: use u8 for addr to calm down sparse
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann
 <arnd@arndb.de>,  soc@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Date: Sun, 22 Sep 2024 14:54:50 +0200
In-Reply-To: <20240922065212.7483-1-nikita.shubin@maquefel.me>
References: <20240922065212.7483-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Nikita!

On Sun, 2024-09-22 at 09:52 +0300, Nikita Shubin wrote:
> ep93xx_eth.c:805:40: sparse: sparse: incorrect type in argument 2
> 				=C2=A0=C2=A0=C2=A0=C2=A0 (different address spaces)
> ep93xx_eth.c:805:40: sparse: expected unsigned char const [usertype] *add=
r
> ep93xx_eth.c:805:40: sparse: got void [noderef] __iomem *
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409212354.9CiUem7B-lkp@i=
ntel.com/
> Fixes: 858555bb5598 ("net: cirrus: add DT support for Cirrus EP93xx")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/net/ethernet/cirrus/ep93xx_eth.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/cirrus/ep93xx_eth.c b/drivers/net/ether=
net/cirrus/ep93xx_eth.c
> index 2523d9c9d1b8..c2007cd86416 100644
> --- a/drivers/net/ethernet/cirrus/ep93xx_eth.c
> +++ b/drivers/net/ethernet/cirrus/ep93xx_eth.c
> @@ -771,6 +771,7 @@ static int ep93xx_eth_probe(struct platform_device *p=
dev)
> =C2=A0	struct resource *mem;
> =C2=A0	void __iomem *base_addr;
> =C2=A0	struct device_node *np;
> +	u8 addr[ETH_ALEN];
> =C2=A0	u32 phy_id;
> =C2=A0	int irq;
> =C2=A0	int err;
> @@ -802,7 +803,8 @@ static int ep93xx_eth_probe(struct platform_device *p=
dev)
> =C2=A0		goto err_out;
> =C2=A0	}
> =C2=A0
> -	eth_hw_addr_set(dev, base_addr + 0x50);
> +	memcpy_fromio(addr, base_addr + 0x50, ETH_ALEN);
> +	eth_hw_addr_set(dev, addr);
> =C2=A0	dev->ethtool_ops =3D &ep93xx_ethtool_ops;
> =C2=A0	dev->netdev_ops =3D &ep93xx_netdev_ops;
> =C2=A0	dev->features |=3D NETIF_F_SG | NETIF_F_HW_CSUM;

--=20
Alexander Sverdlin.

