Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F919B5B4
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282648; cv=none; b=X6E4Nofai9xgnYg7my9AJRrl55g+QVVDP1dzd+pMNSvs6P+pSqRes+Fq2761DbzaUYOYCgA6vJQI5sZlg1Oq6AtqSdjrDMOsh2RIETZuixg+vfhc/YVFF4sauzJbK5IgAD4gS7PyMFOvVf9LabmnzxldgaoFz1ElEAm2mVgrCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282648; c=relaxed/simple;
	bh=Uh5WoZ/+KDvafkHZGKE3HMdNVuvF4hQup8Vi4pC+zwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1poaYwu08Q0bMy8q2xq+WxAOqifYOD8Dp9WLyFS49scsQWrRGLefY47qCdabZEUXv1EP3K2MyuYZabiHJTmjwJelqemGemmpW0rBY2E223aDAo1W4fSo/++CwAZdlBJgC8WcJpkNCYY5/rhz8lZu0FolBJy4Odlk+xBo9eSnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO/s++ei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO/s++ei"
Received: by smtp.kernel.org (Postfix)
	id A15F5C4CEEB; Thu,  6 Mar 2025 17:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88223C4CEE9;
	Thu,  6 Mar 2025 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741282648;
	bh=Uh5WoZ/+KDvafkHZGKE3HMdNVuvF4hQup8Vi4pC+zwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZO/s++eiax4CbiGEErmnqf670Lts4lUgrYbO+4ifupjIHsxlJaKxvMGvXbUferZWY
	 i+VSmSlLo5Kst9K7ioVgRpIctLkvLj+fHgw6H+Q7HJ3xia+GPCZQ5sQNVfUoIxiCXW
	 amhubUNul2gD4S2J7GM+shjpqnVgXaquIpNgErYRSBNTTzpF3Lm3V+VC3epyMSsRMp
	 D1AjY2WvwwZg0WWfz1TrJUg7r8yxI/cY9h7TClCzu0RlGNjfpJTlCVtnCiNmXwCKNk
	 PRA4S+GD6/dQGiVVtaKnmq9W2cn06gb50A74DmdzaxQ8XehVLKp60E61fJhpOLombh
	 Lf530jXd1jI5A==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso1447635a12.2;
        Thu, 06 Mar 2025 09:37:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPJl8TntUxws7qoWQOnUdI7mGO1U8SYB43If6scff6lVuG7IKjiG5b1nq1CWtE6KcsmW9G9g==@kernel.org, AJvYcCWX+6zSLAEJzpwsDVMLPa0xh3p7IOEkttlXW58uAI3dFyUON+GwWQLbev9n0/hd/WQoERVX1A==@kernel.org
X-Gm-Message-State: AOJu0YxnSlzOOMdQ2Ltmr/bMM2nlm4SwZ+aHTh/rCiiUSgCaTdsQdhxW
	mWmnZkoyR2ReociIrA7r1uCVtoDhG5sHTAFc7BHeWnm+t+2mJxHj1hVlG09bH5aI1r7GEA5CUl0
	HEyMJrZNrWZOUd6XOMBHBUWP1lQ==
X-Google-Smtp-Source: AGHT+IFv/GsY2e7PYu/lH1gS0DWi7oxJtOeaIQ3tJ41RiGURBA1av82F0D/7rGiK056rWj/5F6ae4u6P5+9Bu7IuWXQ=
X-Received: by 2002:a17:906:6a27:b0:ac0:6e7d:cd0b with SMTP id
 a640c23a62f3a-ac20d951583mr867464666b.34.1741282647058; Thu, 06 Mar 2025
 09:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305224952.2995841-2-robh@kernel.org> <174128244841.2024061.11431672640522584852.b4-ty@nvidia.com>
In-Reply-To: <174128244841.2024061.11431672640522584852.b4-ty@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 6 Mar 2025 11:37:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJHFSteS8zZTDqvysaH5iqwcDELa+Vt-vWL+nW+jXmdFQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrxisKr7Gsk3atDD3dtOkh8vqfUsHWTCU7CsAbxUIk7FAomGTiWNcfv6a0
Message-ID: <CAL_JsqJHFSteS8zZTDqvysaH5iqwcDELa+Vt-vWL+nW+jXmdFQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] arm64: dts: nvidia: Remove unused and undocumented
 "regulator-ramp-delay-scale" property
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 11:34=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
>
> On Wed, 05 Mar 2025 16:49:52 -0600, Rob Herring (Arm) wrote:
> > Remove "regulator-ramp-delay-scale" property which is both unused in th=
e
> > kernel and undocumented. Most likely they are leftovers from downstream=
.
> >
> >
>
> Applied, thanks!
>
> [1/1] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-=
delay-scale" property
>       commit: 90a1dc90d08bd1b8a324d4272d06d74525f51409

Arnd just applied it too...
