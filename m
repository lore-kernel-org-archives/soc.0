Received: from server2.inspiren.my (server2.inspiren.my [137.59.110.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D472459F6
	for <soc@lists.linux.dev>; Tue, 15 Jul 2025 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=137.59.110.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752614915; cv=none; b=WrweTg39KcDn6uMQhEncntTlUHmKGsspuuxt011kzZ9W+t1um5dXIos5T5bA0YLJai/BOvAhrNk9Ya8iS7KQ4yjcBkLW9yRyWNmPtxADjhiAsJqR/OyH4BRgaHrabDA7VwnmvtCBHZihTxTm7v44bhWfSXBOKEtlzfTxfxjtPBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752614915; c=relaxed/simple;
	bh=knQ6LRpSsX+5lYS44U128bSy1aygsBec4z35efrJQss=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ituoX22iuqU9gr8aLZY4PwFd8KV0Ci0olepgRhxQiiHwDCkNOZoFGL16UTD3nhrxugrTqyUnRrA2+rIYMcDlVF49Z5Gh3cyU1S1g7u5VDI2v3UeNHk9p1C8SaVJinSZevAdO05QAFOJ2nqh8C53z7BiEl1AlfyTqrZv9Zx1nuX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=topsglobal.com.my; spf=pass smtp.mailfrom=topsglobal.com.my; arc=none smtp.client-ip=137.59.110.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=topsglobal.com.my
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topsglobal.com.my
Received: from [185.153.177.107] (port=44339)
	by server2.inspiren.my with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <admin@topsglobal.com.my>)
	id 1ubm2v-00000001rOr-02Ys
	for soc@lists.linux.dev;
	Wed, 16 Jul 2025 04:14:42 +0800
Reply-To: sales@lumfinance.com
From: admin@topsglobal.com.my
To: soc@lists.linux.dev
Subject: Request for Confirmation on Quote Submission
Date: 15 Jul 2025 14:14:36 -0600
Message-ID: <20250715141434.85CDEA75FC81AF1F@topsglobal.com.my>
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
X-AntiAbuse: Primary Hostname - server2.inspiren.my
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - topsglobal.com.my
X-Get-Message-Sender-Via: server2.inspiren.my: authenticated_id: admin@topsglobal.com.my
X-Authenticated-Sender: server2.inspiren.my: admin@topsglobal.com.my
X-Source: 
X-Source-Args: 
X-Source-Dir: 

I would like to request a quote. Could you please confirm if I=20
should send the quote request to this email address?

Thank you and best regards.
