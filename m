Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1C3451CF
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738532; cv=none; b=ry7UoI6xcZ+qvzO+mX0Ya5aXPdgCJH8FKzm1dCYoNfOCXAQAR19quQFfautTkHVDzHFGcIrF6wWceUu6U2AA5WCBzXCpJP5/06dj2IUx4YkSY8ScVzhlpWx4YLlbPuoWu9tjfWPVRIGn7m9+rWp3zgkC2OPBe+3JkGZB6EHiSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738532; c=relaxed/simple;
	bh=Yh7w0GULXsUtsxQyVqeTx4DqRsYtHW1YHRE4G/PnOxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cvTxm/uUwjZGiEdf7kJ0LwUVjZ6v9XZepum9U0QYn0Bqb5Ew+wgcZsJZ9jEHcQMam2g3C16cJpRh/dNPimwwDuQ05ik0zhS4B6gelHnStm+c+ByqJc3FhSBpkWDel1s7NEbgMJwbc1jtzYX675b0QyId85H9Kvd5QDV1QWP+5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BPlZNlmf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BPlZNlmf"
Received: by smtp.kernel.org (Postfix)
	id A0DEEC2BCAF; Tue, 17 Mar 2026 09:08:51 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B748C4CEF7;
	Tue, 17 Mar 2026 09:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B748C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RmR20+HOUCm1UbnC886tHfKXPT4oDC9ABYMrrw1uIq8=; b=BPlZNlmf8H+uMknFzE+4Zff0JT
	Y8N3+8qOYbsakjtr/tiiTCLhNzOmODl6A2NYgXv8fBWBnSvfeQQ7SxU2dxLeVYcfFlUSiXl5hZ4tK
	J/e5sd4mZ/SPZ70TInHUSjMOfh4/i75M5PooA47ni4mw1OCOErIsCM+dceJvGjEBGlA36SYEjYaPa
	ohP7sNXfpayYHXBM4ydFCVnBBUfTxlwq5d5OHu+G+Of5WfKUZHmMBJVlp7VaYcHGyD73/ftzv66hK
	nU7mgrGF5l6d5192A7rJw0/BQo+WqaO+0MsrD7y8C4CsEW/vYQU4ZhFrdtXGyGkQRpr/9I2pA2bZG
	merpDMig==;
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.1 #1
Date: Tue, 17 Mar 2026 10:08:48 +0100
Message-ID: <2031768.PYKUYFuaPT@phil>
In-Reply-To: <20260317-impetuous-attentive-penguin-43a503@quoll>
References:
 <13966995.uLZWGnKmhe@phil>
 <20260317-impetuous-attentive-penguin-43a503@quoll>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 17. M=C3=A4rz 2026, 09:48:30 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Krzysztof Kozlowski:
> On Sat, Mar 14, 2026 at 07:45:34PM +0100, Heiko Stuebner wrote:
> > Hi soc maintainers,
> >=20
> > please find below Rockchip DT changes for the merge-window for 7.1 .
> >=20
> > So far only arm64 changes :-)
> >=20
> >=20
> > Please pull.
> > Thanks
> > Heiko
> >=20
> >=20
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >=20
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git tags/v7.1-rockchip-dts64-1
>=20
> Next analysis reports:
>=20
> Days in linux-next:
> ----------------------------------------
>  1 | + (1)
>  2 |
>  3 |
>  4 | + (1)
>=20
> Please keep changes in next for at least few releases, in case of
> development pulls. Allow community to actually test your code before you
> send it to upstream maintainer. We are early in the cycle, so there is
> no need to rush changes which were almost not in next.

okay, will adapt to the faster pacing of PRs getting looked at.

In the past I was trying to make Arnd's life easier (not sure if that
helped or not) with the PR available, so that he could get to them when
he had time.


Heiko





