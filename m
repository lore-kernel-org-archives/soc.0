Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B04342CB3
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 05:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780379241; cv=pass; b=A90S+IdWe3s4qq3tU5yEfM6INBUcxKrsnvidYSYaDatOTHduaDuTZ/P9E/44v1XRzX29y4q02i8yxjtIW7h354VMlHC8HLlMgdA4nMUgRzDub2xpePFk35E3dk6QadZdRM7c657tKcHhLKpFn+Dvs9LU9LhAv54uSh5dUX8HY/M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780379241; c=relaxed/simple;
	bh=5na4b+AqaZypoMswo5CeksSCaWv+KfpNA6F74DG3I0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lh0KxMUmWkiR0lcnLx+w1nF9gswPXseZDkIUifp+9hD4w/qkhadetpXY3rpSWqJhUBZZVJrBQr2MJ/5SEe9kQPpMb58BRQkxJJSa2pZoeZbKL1B3TsU3u0u4Ud8M3Jdmb53KCdYqwJLsCdBXjrpiusr0/lMUV9Fr0JwOeq423qo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=IFKbvTpe; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IFKbvTpe"
Received: by smtp.kernel.org (Postfix)
	id 538F51F0089A; Tue,  2 Jun 2026 05:47:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780379240;
	b=lQTVtiaPY2U/1FcDLS8PK99N6UzTBFYyhINFIIKXSAsbpsGYiDiYoAGX5vlUbb+MmWXI
	 GQ2IS2a5pIvh6Z9rxhE8XpMLAdgoxHNLFDXLFRGfNambCKRY9oN0sPilIACa7/aiGi3Dg
	 u0Rid2qFAkGnU5TCKURx58upk5BuneFVbSbwzRnDfB+09GX7zL3vf5sSZEDPdi7ZODBaB
	 SA3xgtX3rQu7XQpLDCjSzhBdQsP0r4e+LVj5+ed9KdY9vutWo0u0LfXr+zUI3wLjbTWZo
	 HPBkvaotnFJ/cN4a2430pbkyhy9SdXnsEEbpudo7kq1AkC/3yqYoI/B+odWEhjYG/Jg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780379240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
	b=aa+4a4hbfHljmd/GWNIN0pBQuOO0ZcGcLKYfKyOUgdkUKH/4384omSsYPC5LKPLy+pq5
	 /Wpj+8P0QnbQpC+TrKLFhrWlIXoLCUQOPHnEujmaX4xSJ1QFrhgxqzRhRlAFwPaXiv9K9
	 BdTSmkdis0LXOXnYIS8zd+rZt+YwAACyNyx/f/E0c89ouzYgFHlvhuvXbk4z/03iQOMzu
	 L1a1zBQv9nXDTXUp7c/Alnb30H0w0i9aVWTk1XMtreu04w2wFLlUWNjybyqLTlKrix+I4
	 slrVGftf7TVjKm5uWCs/OcTZl9sdck7Q1EvPpEMi06extDCTkQ7NXg9Y0pswv0+c8Rg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=IFKbvTpe;
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A96A81F00898
	for <soc@kernel.org>; Tue,  2 Jun 2026 05:47:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=IFKbvTpe
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A96A81F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf55c39e16so11034395ad.0
        for <soc@kernel.org>; Mon, 01 Jun 2026 22:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780379239; cv=none;
        d=google.com; s=arc-20240605;
        b=almDdKxAZKK86h3aikbZaGMRdT5nAphpNpEjwrSt/wGxtKFm2x8sprg7RyoSfxAktt
         rbmGVvBjAteCSJ1UexqrJ9RmYL0A1wbUQ6flikqv0hzHmjYdX2JXaysQHltT6vrFub95
         a6Lu2Za0E5nf04vxgkpDsqegurcgU3Lj0DQul+uFdNSxRRlQg/1W/bEJr/Jo7DxX3O1u
         IONelJ7aUHalCefFXBxzSyUX12nioqIDpY20HKfovItrnJ/1/DplKQ9iSJBmZOBpSzBD
         feR4ZcMO3awJxOsCdCIeAwNe0Vv9Gac5CPAz50Zl8ZMbK71dCBpEsoOfPmcmKBQ05KfY
         OD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        fh=g4mzhRf5UsztjhNkvHxhLykQ5MimJUeQ7IWmGMlxaTU=;
        b=itaDDcxuzTOIvXCsy0lGGV+l/WQQlv7/6Jm5zTEn+kY0nCRIa7xsOmxQhSZkwOIrou
         VSts5GJ5F792WSJx1Mjfx0Sx1c/ZPRPaGgW4khhwmuC5lbrvzvFvKg/+Ye7pYD/qce+n
         0k+rRJEwNb/cZeVK3ZyRjbBH7XFmKvkX1OKJx/I7+CUxfx/8W/UxrN6d1yh1bpvJy55X
         Dsf4FP1EdKO3Fw/F73LP39lnLV3EnxHLFBp97C57XuVwAUDd1hBF+ywoVL+OcH1eLyta
         oVy2LtPMAdRWlHgxHl6hQGEcHmqXLXzwazPxWTdBlLVB7n8iJieucimhFmOwfAtfrXK7
         TEsA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1780379239; x=1780984039; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        b=IFKbvTpe6X8iB+dDMFSX91p3Z1rDMtUKnkqLJzQ4U6C6iV8g/z8HeRVfTGhmsdWyR5
         PYOzZi/uoS1t0XjYmdWjONrXgACJW+ZVj25Gh1lx2Zylh3uAi/7j1za0kaLL5SWhU1JK
         3q3rtKuwyWFfKa5rTSLdmj3601nOggWGko/on5/dMjXwzBJgDU9/nupBFR2zP54pLccD
         W96fE23KDuGn2/HiiJcesBITKIPUGITMeFhGrUbXfM9Up0KDazScyUCjdJejUsvu+8Gf
         sLfCel0agn9b5E9urjyj1xUlXvu66BW+L2TKsRnS7nJlfPwMV1twqbH1mFMsxg0oZ1rY
         TXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780379239; x=1780984039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        b=swZk4BPu5J1UYzLFCPwscoPwnl2+NcGgEwOesf13KWkuYoGM7WzbXshoV8s5iCDm+c
         FetJ/cMi6HZ44OlGcIuYGi2fmUzuf2ZvIXGlQnJTKX2FZLPx0x9ulWAErQMT2Zt6fdYU
         52qjxyU1xj7zns3bNhaYk219HITry/yJc50GZOZHzVMEJ08xScpv/YcCT90NYvtHxoxH
         Ai+AZvbSPnCerntClhdqHl7cozRcLGuG5B5tgmL8NudGpmLOLSUm+d6/0GFD62N+GOK9
         8ExxnfFQKRGHIPy+Eznscy9VjYXRnborn/0yP4dYUkKoMkj5wXs+9U7b5SUkKlRSkhyZ
         Undg==
X-Forwarded-Encrypted: i=1; AFNElJ964+PsWm2wzzg8UMgaMm6abLZXQaaOwnodVMqGloNtM03v1IuaUot8/lDqP3CjVMoWeFI=@kernel.org
X-Gm-Message-State: AOJu0YxXoas6TuA1IYpRn0xgPbS097tJRTpgK8oWi0QihULEUBu4w6UP
	k9GI3fiS4Zyf6mMqiJbHhq6e+anGHQrCXKdqmsXsgK6bacgAlR1prVVonAq1L15OHLllXEveuYd
	fnYGbk7by5oSvLbSotkX5/CE3s3ro5Gs=
X-Gm-Gg: Acq92OFsaKbsIzLwzfDlK5cvZFadj9pFA1PvZCf+e2yyZzfk8TE6Sor5u9nXUuGeyJK
	BiWzn/YP/ojeV7r8vDj4I3Do+z3c7Se9Cmmcj63TtwaRDkFi2Db1XKjaMcDjwubceqx/5RHwjWb
	coelstyBmZhRNUamK9eykBywVZ85I3fSeoHuw5b7886M0O1tKqT/hVtZn5lQ1Y5s890CE4/zgv3
	OZ7IFDZHoAQabF9g1MtnV79KlvikY8EuaYvX71lqa3fy0hglAyvmJYezuro+S2EBZrKt7k6+s+s
	fWi4aFfKgBjCIjB1QR3XsjzI6wEObnB9lDDMKulLBSjDLm0z8N0=
X-Received: by 2002:a17:902:f606:b0:2bf:367b:f46f with SMTP id
 d9443c01a7336-2c10cd1dbaamr21848025ad.30.1780379238839; Mon, 01 Jun 2026
 22:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org> <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
In-Reply-To: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 2 Jun 2026 07:47:07 +0200
X-Gm-Features: AVHnY4IB5RtNIaO0mVfpt98zsyzRrKUY-xCKF5XmkQB8dMk3X6syT-ZazZkET0k
Message-ID: <CAFBinCBS_38Yg6aXFpKhpufEaYn7biUEDLnB9tn6Si7TFHdSuw@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, soc@kernel.org, arm@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Jun 1, 2026 at 10:06=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Neil,
>
> thanks for your pull request!
>
> On Thu, May 21, 2026 at 3:19=E2=80=AFPM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>
> >        arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
>
> This commit has a problematic Fixes:
>
> commit 6f14ba3c3fa3d67b72e052f431f6776470eb2cbd
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Date:   Mon Mar 30 14:11:21 2026 +0200
>
>     arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
>
>     Fix introduced invalid property for Khadas VIM4 sdcard regulator.
>
>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
> regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not
> allowed ('enable-active-low' was unexpected)
>
>     Reported-by: kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-l=
kp@intel.com/
>     Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add
> power regulators")
>     Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
>     Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>     Link: https://patch.msgid.link/20260330-fix-invalid-property-v2-1-228=
c51c8de93@aliel.fr
>     Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Commit 60eff75ac67b does not exist in the SoC tree nor in Torvalds'
> tree.
That should be 8f4e4fbd5072 (which is part of this PR - as the
extraneous property was only found after applying).
It seems that Neil did rebase (to modify or drop a commit?) after this
fix was applied. But I can't fully recall the details.
Linus, what's the suggested fix in this situation?


Best regards,
Martin
