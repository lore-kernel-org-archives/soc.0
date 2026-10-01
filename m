Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A83FF1A9
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856073; cv=none; b=hPPO5e5GyqRqRe2ZvlMqGJ9Fpwc4CP2kQi+UmEQkT0g86DJFQdg5pnIVBwaPJgSoLabRMdx7Iv5Rp/CHPs7lr6c07Gg8oErxjdPfG7SIuXDqL4oEfdVHApKd9W0nw/DjmQ1w/Nv/+D1Z4kf95Ih8cP1GnnjH/pG9AFNxiy/Nt84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856073; c=relaxed/simple;
	bh=h2IzzNo+qE6mrdvihygbPvckmObVTIWSds81BIdB/cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXYB7txkkY/4NMs60/IruAOaJFu1xYvJs+ZSQ0CsYSOPogncl+xkSS2IUDNMHqHElbnCm+owsG8+3raZ03HYc5id94/um49+/tjch8vPZVbeCNNzrWvLCXe77EGCeHTuVQePI53Em0MUJOlTQHGAXcUGx2IZ8zHOGUegeYdrin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAgCFphv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAgCFphv"
Received: by smtp.kernel.org (Postfix)
	id 8E13D1F000FF; Thu,  1 Oct 2026 12:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE901F00898;
	Thu,  1 Oct 2026 12:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856070;
	bh=HgL/n87wUIynRIBk3hVwoxTR3GOoA+TrpsX5Ikeksvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fAgCFphv5Sno6BFZGsyTHXNBEB+eEqzkISa1m4UJbBycGe6F8kIriqtcbA/m3xo2l
	 SrrCuXT2VYNtC7xP9AD4SZGlq3C7UWD1F59oDTRceyE6mxdogAQzgiFMabsfG7CWVh
	 q5rJjdoAkZ4E/2upHbNb3wsmcZ8Zp1v+VjmQq5qxQaryS0+1S8sMyvFXoCtTSk+aG6
	 BYKD0jYkCnXsj8FANeW6SLCZ8HEQOwd+qfVXHIRHwrStF+DSGZH6zcvCtaj7Ge7MPg
	 r1n79dpw4AXbS5xzu4Mx/RxpNQKqUtgOsu/yHJran6Hitxr65LM4p3s0TY2NyedlRQ
	 Il3BRLEwtnIGA==
Date: Thu, 1 Oct 2026 14:01:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Wangao Wang <wangao.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dan Carpenter <error27@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
	Gourav Kumar <gouravk@qti.qualcomm.com>, Hongyan Xu <getshell@seu.edu.cn>, 
	Jason Pettit <jason.pettit@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Linmao Li <lilinmao@kylinos.cn>, 
	Luca Weiss <luca.weiss@fairphone.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Pan Chuang <panchuang@vivo.com>, Sreeshankar K <sreeshankar0910@gmail.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, bui duc phuc <phucduc.bui@gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v7.4
Message-ID: <20261001-stalwart-winged-curassow-6ff14c@quoll>
References: <20260923025246.407729-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260923025246.407729-1-andersson@kernel.org>

On Tue, Sep 22, 2026 at 09:52:46PM -0500, Bjorn Andersson wrote:
>=20
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b9=
35:
>=20
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-drivers-for-7.4
>=20
> for you to fetch changes up to d3bacfccd82c974a541398a5ce310de7546b525f:
>=20
>   firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA) (2026=
-09-16 17:07:24 -0500)
>=20
> ----------------------------------------------------------------

Fails to build:

drivers/soc/qcom/socinfo.c:25:27: error: =E2=80=98QCOM_ID_SM7250=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98QCOM_ID_SM7750=E2=
=80=99?


Best regards,
Krzysztof

