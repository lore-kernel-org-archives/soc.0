Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C0A253B66
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516791; cv=none; b=Nf/pDzCfiIawrHaVmySI7DYM61GOBGPXGxSb/ovbOKs9X8/gKdcn+mB7QuKfLj0tSEojj2MQ60Sq0UIsjzb3kHK1DZ3ahWyWPNaUZ1gmZjGcO+lWuFMgedpw2A0S3hb8Z9vrH6+8a6ygpVbVG4oECVoCUzj9dvB9Yx5LjkgeCFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516791; c=relaxed/simple;
	bh=NvXW18QCEtsRxrZ7yB3lfIzA1r8DZe6mWM0EvnAeRqc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=MP3Rr2sJ/2CfaIQU3QFPD8+VqQDb2eLnSU+Sx61ydlluHeofFjAwBRJmCgLTPwe3AWfMPi7ZaCqkxwUYyj4cg1uKRZ863aORXl9LW2B25hb0bGUzj9FFLrmwBNdS6nBH83tYwtophkYWLI+/I/wmUf+v5nwJ/r1f//IsQJWhfao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jc522jtw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jc522jtw"
Received: by smtp.kernel.org (Postfix)
	id 398CAC4CEF0; Wed, 10 Sep 2025 15:06:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7963BC4CEEB
	for <soc@kernel.org>; Wed, 10 Sep 2025 15:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7963BC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso43669865e9.3
        for <soc@kernel.org>; Wed, 10 Sep 2025 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757516789; x=1758121589; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UnaL7L3IAHqWgKBL7OUft2gs1327QkkXhfhIjPFV6o=;
        b=jc522jtwGb/O/7pgII9DZLFhCf4oY/UCyDjYPYa6DHGKvCStNLTx7aI8NFxoXHeUMF
         3kHNoWYGHCMdJ3yzVmSInas5Ty1E7sPW2kqior7hULMS9P5icEwtAUkgya0KiVssxnNo
         3bR703E0dNbaTXjIlt1qTCrhVDesjAt234Nl8ewGH1zgUKQprfVopmOn5Eu7F5flJgkJ
         u57Hr93HFHHSMR8H71J4wqCj7bGnrD+7W3kgwl96k5Z50Xq1b4ncHYi5qkTTMxicFD2B
         lozVqAda/J7+4btq6xvCnF7g9GxhjmsCnATQXxHCfD/BcWhrVpzOxoLs/pKEt9jPn58X
         IUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516789; x=1758121589;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UnaL7L3IAHqWgKBL7OUft2gs1327QkkXhfhIjPFV6o=;
        b=W59LaWrGkVQ0jZBbXZm8UHiCtPseNBrd0R753SVXTB0Hv33r87Q/V6BJKT5fODrDjb
         iwL8f69s8D5U2rO62gUIaGrJ9qbbR4ksUXxWG/H5uNHGZhazG3d0yZUE84/s9OQxevEy
         Nn1JcyTXlUR+B7Rmvb2jtf9y9RwRBw+q1Kbi0jePfVi8wT4i9b+uYS+xWys/K2POBNNR
         wJz56IIwiRfeYFTFWSuzc5Jfy/WYopDiEDOF5NDQrDg+bjiZFiPbXYSzpdB7pr8vwVqg
         tMcHAQfwQIxFqW+R+HZoWQfJ9ZFOa581iVB9XuiVQT6BH+thXMirsQqp22CsFUTNXZqK
         CwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVShqOnZfm9bFun2dOArrzowL4BOF4yOysSmCMIBsxdofruETx2HmVgk+EhsDb2G3KXFbI=@kernel.org
X-Gm-Message-State: AOJu0YyiNb9PZsDXjCvKkIBuNAvjwKQJ7G1cF/Atz3G4fd79pbS60PiG
	lhTmg58zpZShgUEZalMsv76vTrd0IFsCOYlbto+F5ByDbp+PDDHeaIok
X-Gm-Gg: ASbGnctFgWLv8rG9w9yDmfQbiMs2dxHnycBYpmNs6AgUCeLI5qMO04Ex1emXK8KN6Nh
	JPgtv3gCmJ0gBwElIbKeIjrSAg5B7e/EFhDkoPrBSdxYGKWJisEUVk5HcEUPACKlQQgKzblfnZP
	N3xgiUXbghrOeupLoDxUkzSyq9HPLeceWZ7xmH53U5wY8NtD158VBQSD3DvNq965oWMMfBQzkN0
	hn/9L+Pg2IGCiYpwvyofHERCMZ6RUBco911P9pD+7cEpGpU+JBU2icWqFKrSeglw6qXeTVa097Y
	TcG0V4qVgm8bK8/HrXUmGRIcRGgz0Vw7S0DckcvhUYCm2i+7Bk6iXE8k7pEtBCEsXNDjT4IzKgp
	VZ4XzviBsFQnzxWNVtNQhHnZdoABVCe0ejCM16j6HT+ed3Q8/5bSGyuvs3SuySDXOPf8CqqecDb
	1qjIy0Ybs=
X-Google-Smtp-Source: AGHT+IGq5osJ3J2x91mbxuEEfrKCMJ5N4iOk1oE53+v9RHLdB2gEeP+duRN8zQkcsOJUcykGAbmisg==
X-Received: by 2002:a05:600c:468f:b0:45d:dbf4:888a with SMTP id 5b1f17b1804b1-45de6da472cmr98217795e9.25.1757516788469;
        Wed, 10 Sep 2025 08:06:28 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d229bsm30924245e9.9.2025.09.10.08.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 08:06:26 -0700 (PDT)
Message-ID: <87c8f50b-90a5-47ed-af60-99a4e075a266@gmail.com>
Date: Wed, 10 Sep 2025 17:06:25 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek soc driver updates for v6.18
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please have a look at the MediaTek drivers patches.

Thanks a lot,
Matthias
---
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.17-next-soc

for you to fetch changes up to f1a68ba5739e42353609438e27a83b08d7f5cfd6:

   soc: mediatek: mtk-svs: fix device leaks on mt8192 probe failure (2025-09-10 
11:48:56 +0200)

----------------------------------------------------------------
mtk-svs:
* Drop reference taken on probe failure

----------------------------------------------------------------
Johan Hovold (2):
       soc: mediatek: mtk-svs: fix device leaks on mt8183 probe failure
       soc: mediatek: mtk-svs: fix device leaks on mt8192 probe failure

  drivers/soc/mediatek/mtk-svs.c | 23 +++++++++++++++++++++++
  1 file changed, 23 insertions(+)
