Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0CB25EFA9
	for <soc@lists.linux.dev>; Mon, 24 Feb 2025 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740396825; cv=none; b=Ql+MqUvWjdGGSaY4P3vHOnq/SLQAfXJgzkDzD61m69KmF2uM3dkLmjhm48pF/v0V5F8sn5WD9WuRNCICYH9md2V6k7XhAp2G/2vG2P90vj6y4/2zGZEBqIkidcCfwJmmzSSmlLPJe8MTysiAgEdtPo5L9iqAaNZqcrPh/fN66Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740396825; c=relaxed/simple;
	bh=4KxrwFmtRAMLhuyFk43mVP8npngVALYXrHkr4zEBa5I=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date; b=jfTYEKzRPMkaG0PalS1hKapj71dcMKqGjcMY0eacstXGdlDs1jD6nJ1QcWOke41XTxueQG9bBQESS7d7o6ZdRai7MqBtFnK7dguHLPJrzBN8BYNEZ8iQRqdL2ZMEW/B3KYAV5RLE4Fis/FPBVpDydZDoOKCwuRxJjZm1eMqpOTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=nititech.jp header.i=@nititech.jp header.b=EFwxfRpP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nititech.jp header.i=@nititech.jp header.b="EFwxfRpP"
Received: by smtp.kernel.org (Postfix)
	id EB8A4C4CEE6; Mon, 24 Feb 2025 11:33:44 +0000 (UTC)
Received: from mailgw1012.onamae.ne.jp (mailgw1012-148.onamae.ne.jp [160.251.132.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39FEBC4CED6
	for <soc@kernel.org>; Mon, 24 Feb 2025 11:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39FEBC4CED6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nititech.jp
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nititech.jp
Received: from mail1026.onamae.ne.jp (unknown [172.22.44.173])
	by mailgw1012.onamae.ne.jp (Postfix) with ESMTP id 65236180D13F5
	for <soc@kernel.org>; Mon, 24 Feb 2025 20:33:32 +0900 (JST)
Received: from NogawaEikiMacBook-Pro.local (p284005-ipoe.ipoe.ocn.ne.jp [153.240.153.4])
	by mail1026.onamae.ne.jp (Postfix) with ESMTPSA id 37A3C884AE;
	Mon, 24 Feb 2025 20:33:32 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nititech.jp; s=default;
	t=1740396812; h=from:from:reply-to:subject:subject:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=4KxrwFmtRAMLhuyFk43mVP8npngVALYXrHkr4zEBa5I=;
	b=EFwxfRpPaKsieyYTPQe4ADZamCS/0y6bdmeZj3bkZO9ThG53nZOba3lo4qYVWyNAI0yXg1
	+klzZ8/mMECWn2WdzZVmccorJIElyT5fOToIEVEJyodhnrV4byQul8Sd98dYXCd/BrcN0i
	D+3Y2J37KA3Qs+oj1AsVzTNvQ5uQay/NVXhWJCTFn/C3x5Fa2x4Urn9KeYlx9Hqv8BSwgp
	vUHehwfu+4twOYpDE3bcz8VLPzIwMm+/xXSVbN1n+F64CDvpN74Whqs7IMl/CvKVSO/yZ7
	ZGBdt1d0pTmq9v1OZIOoWpRak+pbFikdfSQ9o71QHIBOohY4DyEFP+F1bJ1LvQ==
Authentication-Results: mail1026.onamae.ne.jp;
	auth=pass smtp.auth=oda-yuki@nititech.jp smtp.mailfrom=oda-yuki@nititech.jp
Content-Type: multipart/mixed; boundary="===============6546905079536757765=="
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: oda-yuki@nititech.jp
To: soc@kernel.org
Cc: niti.info@nititech.jp
Subject: =?utf-8?b?QUnmtLvnlKjjgavplqLjgZnjgovjgZTmoYjlhoU=?=
Message-Id: <20250224113342.39FEBC4CED6@smtp.kernel.org>
Date: Mon, 24 Feb 2025 11:33:41 +0000 (UTC)

--===============6546905079536757765==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgo8c3R5bGU+CmJvZHkgewogICAgZm9udC1mYW1pbHk6ICdZdSBHb3RoaWMn
LCBzYW5zLXNlcmlmOwogICAgbGluZS1oZWlnaHQ6IDEuNTsKfQouc2lnbmF0dXJlIHsKICAgIC8q
IOODh+ODleOCqeODq+ODiOOBruaWh+Wtl+iJsuOCkuS9v+eUqCAqLwp9Cjwvc3R5bGU+CjwvaGVh
ZD4KPGJvZHk+CjxwPueqgeeEtuOBruOBlOmAo+e1oeWkseekvOOBhOOBn+OBl+OBvuOBmeOAguag
quW8j+S8muekviBOSVRJIFRlY2hub2xvZ3kg44Gu5bCP55Sw44Go55Sz44GX44G+44GZ44CCPGJy
PgrosrTnpL7jga7jgqbjgqfjg5bjgrXjgqTjg4jjgpLmi53opovjgZfjgIFBSeOCkua0u+eUqOOB
l+OBn+alreWLmeWKueeOh+WMluOChOaWsOimj+ODk+OCuOODjeOCueWJteWHuuOBruWPr+iDveaA
p+OCkuaEn+OBmOOAgeOBlOmAo+e1oeOBleOBm+OBpuOBhOOBn+OBoOOBjeOBvuOBl+OBn+OAgjwv
cD4KCjxwPuW8iuekvuOBr+Wkp+WtpueZuuOBrkFJ44K544K/44O844OI44Ki44OD44OX44Go44GX
44Gm44CB5rW35aSW44GuUGguRC7noJTnqbbogIXjgpLlkKvjgoDjg4Hjg7zjg6DjgYzlpKfopo/m
qKHoqIDoqp7jg6Ljg4fjg6vvvIhMTE3vvInjgoTnlJ/miJBBSeOBquOBqeOBruWFiOerr+aKgOih
k+OCkueUqOOBhOOBnzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTogbm93cmFwOyI+44K944Oq44Ol
44O844K344On44OzPC9zcGFuPuOCkuaPkOS+m+OBl+OBpuOBiuOCiuOBvuOBmeOAgjwvcD4KCjxw
PuOBn+OBqOOBiOOBsOOAgeS7peS4i+OBruOCiOOBhuOBquWPluOCiue1hOOBv+OBjOWPr+iDveOB
p+OBme+8mjwvcD4KPHVsPgo8bGk+5b6h56S+54us6Ieq44Gu44OH44O844K/44KS55So44GE44Gf
QUnjg6Ljg4fjg6vjga7plovnmbo8L2xpPgo8bGk+44Oe44Or44OB44Oi44O844OA44Or44GqQUnm
ioDooZPjgpLnlKjjgYTjgZ/ml6XjgIXjga7nubDjgorov5TjgZfmpa3li5njga7lirnnjofljJY8
L2xpPgo8bGk+5paw6KaP44K144O844OT44K544Gu5pep5pyf44OX44Ot44OI44K/44Kk44OU44Oz
44Kw44Gr44KI44KL44Ki44Kk44OH44Ki5a6f6Ki844Gu5Yqg6YCfPC9saT4KPC91bD4KCjxwPuOC
guOBl+OBlOiIiOWRs+OCkuOBiuaMgeOBoeOBhOOBn+OBoOOBkeOBvuOBl+OBn+OCieOAgeS4i+io
mOOBrnRpbWVSZXjjg6rjg7Pjgq/jgYvjgonjgqrjg7Pjg6njgqTjg7Pjg5/jg7zjg4bjgqPjg7Pj
grDjga7jgZTkuojntITjgpLjgYrpoZjjgYTjgafjgY3jgb7jgZnjgajlubjjgYTjgafjgZnjgII8
YnI+CuefreaZgumWk+OBruaJk+OBoeWQiOOCj+OBm+OBp+OAgeiytOekvuOBruOBlOeKtuazgeOC
hOiqsumhjOOCkuODkuOCouODquODs+OCsOOBl+OBquOBjOOCieOAgeOBqeOBruOCiOOBhuOBqkFJ
5rS755So44GM5pyA6YGp44GL44KS44GU5o+Q5qGI44GV44Gb44Gm44GE44Gf44Gg44GN44G+44GZ
44CCPC9wPgoKPHA+PGEgaHJlZj0iaHR0cHM6Ly90aW1lcmV4Lm5ldC9zL3l1a2luaXRpdGVjXzIy
OWIvNjI3YzczYzUiPmh0dHBzOi8vdGltZXJleC5uZXQvcy95dWtpbml0aXRlY18yMjliLzYyN2M3
M2M1PC9hPjwvcD4KCjxwPuOBiuW/meOBl+OBhOS4reOAgeacgOW+jOOBvuOBp+OBiuiqreOBv+OB
hOOBn+OBoOOBjeOBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBl+OBn+OAgjxicj4K44GU6YCj
57Wh44KS5b+D44KI44KK44GK5b6F44Gh44GX44Gm44GK44KK44G+44GZ44CCPC9wPgoKPHAgY2xh
c3M9InNpZ25hdHVyZSI+CuWwj+eUsCDmgqDnqIA8YnI+Cj09PTxicj4K5qCq5byP5Lya56S+IE5J
VEkgVGVjaG5vbG9neTxicj4K5p2x5Lqs6YO95paH5Lqs5Yy65pys6YO3NuS4geebrjI155WqMTTl
j7c8YnI+CjxhIGhyZWY9Imh0dHBzOi8vbml0aXRlY2guanAvIj5odHRwczovL25pdGl0ZWNoLmpw
LzwvYT4KPC9wPgoKPHA+44CQ5pyA6L+R44Gu44OX44Os44K544Oq44Oq44O844K544CRPGJyPgrj
g7vmnb7olK3lpKflrabjgajjgIxBSeOCkua0u+eUqOOBl+OBn+ODh+ODvOOCv+ODieODquODluOD
s+Wei+aVmeiCsuOAjeOBq+mWouOBmeOCi+WFseWQjOeglOeptuOCkuWun+aWve+8mjxicj4KPGEg
aHJlZj0iaHR0cHM6Ly9wcnRpbWVzLmpwL21haW4vaHRtbC9yZC9wLzAwMDAwMDAwMy4wMDAxNTE3
NTkuaHRtbCI+aHR0cHM6Ly9wcnRpbWVzLmpwL21haW4vaHRtbC9yZC9wLzAwMDAwMDAwMy4wMDAx
NTE3NTkuaHRtbDwvYT48YnI+CuODu+S5neW3nuWutuW6reaVmeW4q+WNlOS8muOBq+WQkeOBkeOB
puOAjOODnuODq+ODgeODouODvOODgOODq+OBqkFJ5a625bqt5pWZ5bir44CN44KS5bCO5YWl77ya
PGJyPgo8YSBocmVmPSJodHRwczovL3BydGltZXMuanAvbWFpbi9odG1sL3JkL3AvMDAwMDAwMDAy
LjAwMDE1MTc1OS5odG1sIj5odHRwczovL3BydGltZXMuanAvbWFpbi9odG1sL3JkL3AvMDAwMDAw
MDAyLjAwMDE1MTc1OS5odG1sPC9hPjwvcD4KPC9ib2R5Pgo8L2h0bWw+

--===============6546905079536757765==--
