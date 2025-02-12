Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EAE206F24
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352831; cv=none; b=nDCnHrqP+m9OEk1Eann333v7UwfhjaiHCB47W/wiT3JOTNDrQTLdsHlEPWQ8fQwUkcJTIVrq36ZLSG5Xm2CpOZpPjT4OUX3aKXq9LhCIz3Iz/yfb4IPE0t33D5qmorcmkwku7C8FuUCZuVs8Q3GCGRDiX4rwI80MBCqE+P7Uols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352831; c=relaxed/simple;
	bh=28ZrG67VYrx3D1mHBQEW/lHYcFEAj3xmmeyTtjgZ7YA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=svhEBzyTJ6jD6jwCTDC7XoEirV1DrHJ2CN/QINC3XOqSjeAL/Fus2NnedUbKHUN8sbJN7ABDjyZoSFtlBjKi0fAxD1clAG7vVwBy0+e2oO+C4jbfMVUfsTuR/B/B0xFbBI3WCfMXg8K2RKlivhlIde1fPt8lHOjijG46UDx7p/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhUXMVjo; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhUXMVjo"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so2305984a12.1
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 01:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739352828; x=1739957628; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=28ZrG67VYrx3D1mHBQEW/lHYcFEAj3xmmeyTtjgZ7YA=;
        b=QhUXMVjoKWhmCpgnqjjepL0ZXp2og9e3+b5TVgDqCqjR0zGw8YGEZfAfWa8SdAgypB
         Clpt5Cidj6HN7GT+l8QiQ/Zxii+W79/AFn34u1h9YLfgIbUhUALLkz0so2AjtxCPZn7Q
         +Qm4QZOnoduDi1OkA/JtWdihswvPLfXqiHr3TD/szf2+BSybaRDnia5hFmLUlloAzTcI
         8G3FSqhk9nyTKaO0T8epXDvqXLSDHYWRxUnBrHzt6w5oOiQh82EiUtOuBSyGNFZrssPi
         cl6meHbUZrupnj92ncDiBGbPHecml3ND7ZflUes69WW8R0sREG2SgsIM6M3GMh9o4q7a
         8wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352828; x=1739957628;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28ZrG67VYrx3D1mHBQEW/lHYcFEAj3xmmeyTtjgZ7YA=;
        b=peDEZgob2cTaMjlv19V/d3yyjmk0MrStSHp5N5uz77TZpqosHyDzVnMBYAsZx6Pf31
         K/HY6GMms2DTjyYiCPfQTlOAJDC0dEty8T9vKhB5wV5ROuAVmEK1T6cu+OOau/VlitCt
         f3aeoi6GSNReQQpswtq8W7apbkFWlK55OTgxxT52BXbShnFExJbqZbcANXu43s8L0qCC
         vPqppAjVACcTagTbCE3Lls1XmJFy3XWTPw9Q0C6bp7RyTI0l7c74slW1nzYx+Ot+ipBY
         jHJTTLrbYE7XlTEXO1wJ1f2rdamXiZQzXJwV28Y6zoWdE1gbYZ0UkblyoHGWl96qPOJh
         Xt8Q==
X-Gm-Message-State: AOJu0Yxj1StJGz3iNhIr6oM2kv9dh3LicZG85zHbLq2k/zPvdWmhMVF5
	uxNUDKehqtFfEAcGr3M/v338QYwAhsC0WfjG4+XG7i99IV33PC02GmD22Z22
X-Gm-Gg: ASbGnct6Prn1KWvz7X0getqJoRmR0lswS/U6u3SU3whq1q29LJhlvTYeuSUmKo1m9w8
	MELJmOKOVgh3GB69t3EmKnN44/BZgZVRl860NLYLY1yM7CAYFluB/Lmo2/0dT7yZoiXUkBpBWNp
	qBnzwBt4Fkitx2MOz7uNH6BQl/lgJ4ipKcWZKpI/oYcAu+kSqbTL0Dy/q5vHjju2E0JgUOoD/D6
	3FmzDur1nW/GI9tLAiSLT2VHSt6E1mm8VndcAlXQ+V8VZZPMd1Sa8cvHijSGuzSzd2LNgwBB25Y
	BYOlHrj0XRc8LQAZABIG86/WLgwt1pWE
X-Google-Smtp-Source: AGHT+IHpqQvjQqIwPaFAzknlkp4GoatkNSlei54PmBgAGgJZumwHx7ny/2UY0zjgf5S9YxNNAfvIdg==
X-Received: by 2002:a05:6402:2344:b0:5db:f52c:806c with SMTP id 4fb4d7f45d1cf-5deadde0351mr1663917a12.20.1739352827684;
        Wed, 12 Feb 2025 01:33:47 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de51877083sm8949195a12.32.2025.02.12.01.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:33:47 -0800 (PST)
Message-ID: <479c4ac407207c093e9e7b46cc18fb254f2ca74c.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Haylen Chu
	 <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Date: Wed, 12 Feb 2025 10:33:43 +0100
In-Reply-To: <prrsy34bv6xskxu7afgmpdwc7lefdh7l2gtm2ejzcwk74zh6lr@23x3llxy662z>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
	 <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
	 <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>
	 <prrsy34bv6xskxu7afgmpdwc7lefdh7l2gtm2ejzcwk74zh6lr@23x3llxy662z>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Wed, 2025-02-12 at 08:29 +0800, Inochi Amaoto wrote:
> > Thanks for your hints!
> > I've completely missed the RTC driver in progress [1].
> > I will provide a patch registering the reboot handler on top of the dri=
ver
> > as soon as it's accepted.
> >=20
> > [1] https://patchwork.ozlabs.org/project/rtc-linux/patch/20240428060848=
.706573-3-qiujingbao.dlmu@gmail.com/
> >=20
>=20
> As far as I know the RTC patch is no longer maintained. Maybe you can
> pick it up?

I can try... If only I can make it work...

> The patch states can be found on:
> https://github.com/sophgo/linux/wiki

Thanks for the link!

--=20
Alexander Sverdlin.

