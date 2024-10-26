Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47878460
	for <soc@lists.linux.dev>; Sat, 26 Oct 2024 00:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729902867; cv=none; b=ImlARad+ADXuPee+d+UnSV2oE5836su6/qLs2OWAkKh9ErMSxfKYYkSX4PsH4PnwtBH1cOTuKx4XoOfdo6NPgFJsqGWlnTFZPVacN3V7ArHh762ylFOPYyMsdX4hHCOS/lObpK22MGAcsF9VJ8335v1yYQIxdzh839CRVZUNmA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729902867; c=relaxed/simple;
	bh=OD8n3cTa2GC73iDchoI0BLzBaopgC/+gShrumD9KsM4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SZl3Y8AIQVyWTKMeXs2nW+I1IfdS1ERi1S4Vka7U44lqPhSLXDeSvVEA451XpM1vmylnrdr8Q/tKA9hnOsEYbSwCbmzk5nuko+QnrHJ31K/yJwTAgTQ/AXSlJ3k1GAC4SCu26yoSk4wFKoP8WzTKLmAY2WF0KZgDHpGGx6ACWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 70815C4CEE5; Sat, 26 Oct 2024 00:34:27 +0000 (UTC)
Received: from www4.stratanet.com (www4.stratanet.com [67.213.225.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59B10C4CECD
	for <soc@kernel.org>; Sat, 26 Oct 2024 00:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59B10C4CECD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cataumetca.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=cataumetca.org
Received: from ec2-35-93-161-92.us-west-2.compute.amazonaws.com ([35.93.161.92]:50742)
	by www4.stratanet.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <info@cataumetca.org>)
	id 1t4Ul7-0000000FjC8-2LaL
	for soc@kernel.org;
	Fri, 25 Oct 2024 18:34:25 -0600
From: Chan Moo Bahk <info@cataumetca.org>
To: soc@kernel.org
Subject: =?UTF-8?B?QlVTSU5FU1PCoExBVU5DSCA=?=
Date: 26 Oct 2024 00:34:24 +0000
Message-ID: <20241026003424.DE4D4722CE164739@cataumetca.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www4.stratanet.com
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cataumetca.org
X-Get-Message-Sender-Via: www4.stratanet.com: authenticated_id: northeasternofficesupply@northeasternofficesupply.com
X-Authenticated-Sender: www4.stratanet.com: northeasternofficesupply@northeasternofficesupply.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Good day sir/madam,

I am Chan Moo Bahk. I have a lucrative business proposal deal I'd=20
like to discuss with you. I am representing a group of=20
prospective investors in the USA, Europe and Asian continent.

We are seeking a professional with whom we can be involved in=20
partnership overseas, who also has the ability to manage an=20
investment portfolio in your country. If you indicate interest,=20
send a reply only via ChanMooBahk@mail.com for more details so=20
you can have a better knowledge of who you are dealing with.

I look forward to your response if this appeals to you.

Regards

Chan Moo Bahk.
ChanMooBahk@mail.com 
