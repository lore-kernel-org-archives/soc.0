Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712227;
	b=ks3gV699BXl1civ3s0tQ4EyN9w15PL1aBYZDkbQeH60oYj1lnT3iF2fbRu2Up+c6J5Lb
	 RqoC1ouXMRDPxFt63ue2taLytvceDj6BjrUxCYZJIbw0dU42RwPD66jnfI+wMwV2e9p18
	 EfwfzGOzOEzBWioYvXPV87MSVfSJAJbOWUtFSV2LQZd2Q3Acpks+xj9sYuwC+GkVe3X9j
	 3UGid6cV7GoKQT4oAyANqWSv84jKRp20L+Pw+FrWpQxvuZvAo+YVbALMJEcLasMxZhko0
	 ii6Zq44/ijsTMtblzL/bQ+u6KsxWuICaL8c/mfizlh9E3IN9ln+e5lT9elcdMVTFuFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
	b=l43CTQ3M73T9Gx4WpM4ay6FvGKB0IkQE95WStX4cBwCpCar8iWnrzjVC70cZphGB2c5N
	 h0kUCBUNB8pTYUl7qzrRhtSOKfIzYN1D3ZMtrInxhBEPWJL1gVjbB1d/9ZuOFb9wwUv20
	 1Ykf6xpbCiUIge5rz1RG6Vgot530xt8k1/99yZLLTeiTe3klSbwsqOKkCTlhrTxTCdLRp
	 J81SMVANORlwTHSQLy/erz771lTBOoyJrcGLRzcVMo4cyDXXdI84mIjFfN8IPV3JbZRsj
	 QXsXhTt6kerz05DcYfb4Kkmi2Xc7RAOk5ZuJxG0CCagvCBZ3SPcR+OIVYhqjCnpGTRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VH5al2XJ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CE0606A32F
	for <soc@lists.linux.dev>; Tue,  3 Nov 2026 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12CE0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VH5al2XJ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso37151085e9.1
        for <soc@lists.linux.dev>; Tue, 03 Nov 2026 05:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1793712224; x=1794317024; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
        b=VH5al2XJUeHT8jL+AEn0OhKdjorRVTevczx8+kOcggrnShpEGrMzHJp6wap7Gnp3hA
         wdqdO4RoWgUJJiLU2nGS0fAZf3S4uTsTBHX2teQjvGNu5fhOjuaC4+j+3dw0F0OofvQQ
         AggDftHu4SGo1EDzymg5ZKK/r0/M4PV16YGbMQIbC2Nd4/ImLliW09PpaPJsF1Bc/ISc
         pbYivKhmfTlDrf+ikDlRI/ue7E3P92+bBjspO/0iwOiB8WrWTSd0U/qrAKpgZgIzSqZh
         QfO3Z7obaD+8nVpTiLWQBvMY6wLDMCP+BucPCuM2ZzLkepX7C+pU+jq98gSb/D1VmmIj
         FCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712224; x=1794317024;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
        b=cFS0qtbubyGyuIMGrx22JVWdlAfFly9vJmQjy4+AriCVBGSNAF7FGtv+kQ5+I2B7Nl
         I/I3LKAgLIliUnP7LSGYekNKaAMc847Fof+y5QUdrEOeB29eIrR/cNeevfCxlQUVIcOr
         CirGJG7spm+CPfHMp+m5gVLiceFuRfU7XE44ia31jO0MNzALRSjD0dinILlH/nS0TSE+
         srGv6nWVV5K1Uo8jX+BY2onHRAqkJ8cfJ+PIqWeSW7AryTIAwDmbhMpzm4nAA5vjCyId
         nwDw7cxtR60smSbWiEz09NC7t65JmB0bOnc9Tmtc5ARI8+OhtA3pIR4ZQESX0FTXs8O2
         LihQ==
X-Forwarded-Encrypted: i=1; AKwUvByByIWS9qLpe95e8PIfBmk7rmWjC1cp0GihMyRrW4uT2FL6IsZxjhJqeaC7PhJRwzesiAI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8HkcBqcclml+dIQkdpotnQ+3xhtwtO9IMyS8nchUERKNYBAgy6
	upGmmgTea2GFMXXtXOXm+wq7FESuPI5SPPAC6EGaTFn5NjcKSrv9oj3NWdDjG/RbY1M=
X-Gm-Gg: AYBFou3jMhgihO/eEtW7ayHt4bRrQnz3+gWFA/MoclJExHvCFm0f8lRtgG2/Oa3pU6v
	HmBr7y2/NCWSdFXfz8H9jKUv/d/N26l2tMDEUfG5xxgm6tieFMnbCUpT43a6cHp8ouaEEbZOvSH
	puH3dxq78avtfkuJ/39QAxvYAFVqtP/wm8oXLIqGufVdGZX8VoQoydFMFJn3AZQ6zdJ80uBQR38
	OFiCeSWVaQKvEPfso64wCaMO2x+oqnmsiPm3pnUK1Wl/zIiNR5VBCsZAmprtwWBKfhnCgQiLmQN
	yvHncoUgpWrbldQA3kd6dyLvIFcC23UxIkpZVFx0EsvyHYkC+opggg0kwjKRDnZ/kTwQmpTfgA0
	V06NxToqZ18YCzvhP6bT3Fl9PxAS9v+60wkl5GSdSA99lrB2VCUHkDyUCdgI378keuFC8uLQt/S
	ZKKLugfzwAVvJPGUToP9wjDdf1ZYUTOC4Z75+4AfOoaYPOb8oHjGbqXCB95mFZsPAh3/vtNRlHg
	g6iYRnCfE1ziYR9mI+bmu7XPsFsqY8N/PXlVEN9xYFKXIu4VTh3fFyr9NuBNvUlcMFGZYEjedT/
	nHkOMC5IVn6oPYF5O5tCuY6Et8SJbQ2nd7bGqHfvoteaooO4Kc9VpOPUqA==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr139983985e9.29.1793712224232;
        Tue, 03 Nov 2026 05:23:44 -0800 (PST)
Received: from andrew.office ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm163615055e9.2.2026.11.03.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:23:43 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,  qinjian@cqplus1.com,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  linux@armlinux.org.uk,
 soc@lists.linux.dev, arnd@arndb.de
Subject: Re: [PATCH v5 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za> (Andrew Gaylard's
	message of "Thu, 24 Sep 2026 18:49:16 +0200")
References: <20260924164922.117236-1-ag@ffroot.co.za>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Tue, 03 Nov 2026 15:23:39 +0200
Message-ID: <sa6mrrqhwv8.fsf@andrew.office>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andrew Gaylard <ag@ffroot.co.za> writes:

> The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
> https://tibbo.com/store/tps/ltpp3g2.html
> It is the platform that underpins Tibbo's industrial IoT products.
>
> This series adds board support to linux-next:

Hi all,

Ping?

v5 was posted on 24 September.  Patches 1 and 2 are DT binding changes
and have been ack'd (thanks Conor).  I haven't heard anything from the
SP7021 maintainer; mails to qinjian@cqplus1.com bounce.

The SP7021 platform entry in MAINTAINERS has no git tree, so I am not
sure how this series should be routed. Could the SoC maintainers advise
whether they can take it directly, or who should pick it up? 

It still applies cleanly to v7.4-rc1.

Thanks,
Andrew
